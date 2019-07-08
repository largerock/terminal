#!/usr/bin/env zsh
# ~~~~~~~~~~~~~~~~~~~

# Get standard distribution info
. /etc/os-release

# NOTE: For some reason needs to go early or doesn't work
if [ $commands[kubectl] ]; then
	source <(kubectl completion zsh)
fi

# ~~~~~~~~~~~~~~~~~~
# Antigen Setup

_ANTIGEN_INSTALL_DIR=""$HOME"/.antigen/"
export _ANTIGEN_INSTALL_DIR
mkdir -p "$_ANTIGEN_INSTALL_DIR"
ANTI_FILE="$_ANTIGEN_INSTALL_DIR/antigen.zsh"

if [ ! -f "$ANTI_FILE" ]; then
	curl -L git.io/antigen >"$ANTI_FILE"
fi

source "$ANTI_FILE"

# ~~~~~~~~~~~~~~~~~~
# Antigen Config

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle z
antigen bundle docker-compose
antigen bundle docker
antigen bundle golang

# External bundles
if [ $commands[kubectl] ]; then
	antigen bundle dbz/zsh-kubernetes
fi
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle webyneter/docker-aliases.git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle chrissicool/zsh-256color

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# ~~~~~~~~~~~~~~~~~~~
# Vars

source "$(dirname $0)/vars.env"

# ~~~~~~~~~~~~~~~~~~~~
# Alias

# Easy jump into a container
alias boop="docker run --rm -it"
alias ubuntu="boop ubuntu"
alias centos="boop centos"
alias debian="boop debian"
alias alpine="boop alpine"
alias suse="boop opensuse bash"

# Git
alias nuke="git reset --hard HEAD && git clean -xdf"
# Git add, commit, push
alias poo="gau && gcan! && gp"

# Project Init
alias projinit="mkdir -p script && touch README.md CONTRIBUTING.md script/test script/bootstrap"

# Cmake
alias cgraph="cmake -Bbuild -H. --graphviz=build/i.dot &&  dot -Tps build/i.dot -o graph.ps"
alias build="cmake -Bbuild -H. -GNinja && cmake --build build"

# Terraform
alias tfgraph="terraform graph | dot -Tps -o graph.ps"

# AWS
alias aws='docker run --rm -t $(tty &>/dev/null && echo "-i") -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION -v "$(pwd):/project" mesosphere/aws-cli'
alias awsnodes='aws ec2 describe-instances --query "Reservations[*].Instances[*].[Tags[?Key==\`Name\`].Value[],State.Name,KeyName,InstanceType,InstanceId,ImageId,SubnetId,NetworkInterfaces[*].Association.PublicIp,SecurityGroups[*].GroupId,NetworkInterfaces[*].PrivateIpAddress]"'

# vim > nano
alias vim="echo 'stop being bad, use nano to edit: '"

# Update
alias updoot="_ apt update;_ apt -y full-upgrade;_ apt -y autoremove"

alias setup-docker="_ apt install docker.io \
&& _ usermod -aG docker $USER \
&& _ systemctl restart docker \
&& echo 'Log out/in to finish the setup'"

alias install-numix="mkdir -p ~/.themes \
&& _ add-apt-repository ppa:numix/ppa \
&& _ apt-get update \
&& _ apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme-square"

alias install-dracula="mkdir -p ~/.themes \
&& wget -O /tmp/Ant-Dracula.tar https://github.com/EliverLara/Ant-Dracula/releases/download/v1.3.0/Ant-Dracula.tar \
&& tar -xvf /tmp/Ant-Dracula.tar -C ~/.themes \
&& gsettings set org.gnome.desktop.wm.preferences theme Ant-Dracula \
&& gsettings set org.gnome.desktop.interface gtk-theme Ant-Dracula \
&& gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Code 9' \
&& gsettings set org.gnome.desktop.interface document-font-name 'Fira Code 9' \
&& gsettings set org.gnome.desktop.interface font-name 'Fira Code 9'"

alias install-gitkraken="_ apt-get update -y && _ apt-get install gconf2 gconf-service && \
wget -O /tmp/gitkraken.deb https://release.gitkraken.com/linux/gitkraken-amd64.deb && \
_ dpkg -i /tmp/gitkraken.deb"

alias install-mega="wget -P ~/Downloads/ 'https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb' \
&& _ dpkg -i ~/Downloads/megasync-xUbuntu_18.04_amd64.deb \
&& _ apt install -f"

alias install-hyper="wget -O /tmp/hyper.deb https://releases.hyper.is/download/deb && \
_ apt-get install /tmp/hyper.deb && \
/opt/Hyper/resources/bin/hyper i hyper-font-ligatures
/opt/Hyper/resources/bin/hyper i hyper-dracula && \
/opt/Hyper/resources/bin/hyper i hyper-search && \
sed -i \"s/fontFamily.*/fontFamily:'\\\"Fira Code\\\",monospace',/g\" /home/$USER/.hyper.js && \
_ update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50"

# Probs update this frequently
# https://www.jetbrains.com/toolbox/download/download-thanks.html?platform=linux
alias install-jetbrains="wget -O /tmp/jet.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.13.4801.tar.gz && \
tar -xzf /tmp/jet.tar.gz && \
jetbrains-toolbox-*/jetbrains-toolbox"

alias install-megasync="_ apt-get update -y && \
_ apt-get install -y libc-ares2 libcrypto++6 libmediainfo0v5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5svg5 libqt5widgets5 libzen0v5 && \
wget -O /tmp/megasync.deb https://mega.nz/linux/MEGAsync/x${NAME}_${VERSION_ID}/amd64/megasync-x${NAME}_${VERSION_ID}_amd64.deb && \
_ dpkg -i /tmp/megasync.deb"

alias install-notable="wget -O /tmp/note.deb https://github.com/notable/notable/releases/download/v1.5.1/notable_1.5.1_amd64.deb && \
_ dpkg -i /tmp/note.deb"

alias install-screensavers="_ apt install -y \
xscreensaver \
xscreensaver-data-extra \
xscreensaver-gl-extra \
&& echo 'Go to   Settings > Keyboard > Add Custom Shortcut  and createa a shortcut with the command xscreensaver-command -lock \
And add xscreensaver to your startup applications'"

# Personal Prefs
alias install-base="\
_ apt update \
&& _ apt install -y \
	vim \
	ubuntu-desktop \
	keepassx \
	gnome-tweak-tool \
	clusterssh \
	fonts-firacode \
	network-manager-openvpn \
	chrome-gnome-shell \
	network-manager-openvpn-gnome \
&& _ snap install --classic slack \
&& _ snap install discord \
&& _ snap install spotify \
&& _ snap install hexchat \
&& install-gitkraken \
&& install-hyper \
&& install-dracula \
&& install-jetbrains \
&& install-notable \
&& install-megasync"

# https://github.com/dracula/dracula-theme
