#!/usr/bin/env zsh
# ~~~~~~~~~~~~~~~~~~~

# Load the theme.
antigen theme tyhal/spaceship-prompt

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
alias fedora="boop fedora"
alias suse="boop opensuse/leap bash"

alias watch-logs="dmesg -THw"

# Git
alias nuke="git reset --hard HEAD && git clean -df" # -x

# Project Init
alias projinit="mkdir -p script && touch LICENSE README.md CONTRIBUTING.md script/test script/bootstrap"

# Cmake
alias cgraph="cmake -Bbuild -H. --graphviz=build/i.dot &&  dot -Tps build/i.dot -o graph.ps"
alias build="cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja && cmake --build build"

# Terraform
alias tfgraph="terraform graph | dot -Tps -o graph.ps"

# vim > nano
alias vim="echo 'stop being bad, use nano to edit: '"

# Update
alias up="_ apt update;_ apt -y full-upgrade;_ apt -y autoremove"

# https://www.jetbrains.com/lp/mono/
alias install-theme="mkdir -p ~/.themes \
&& wget -O /tmp/mono.zip https://download.jetbrains.com/fonts/JetBrainsMono-2.225.zip \
&& unzip /tmp/mono.zip -d $HOME/.fonts \
&& gsettings set org.gnome.desktop.wm.preferences theme 'Yaru-Dark' \
&& gsettings set org.gnome.desktop.interface icon-theme 'Yaru' \
&& gsettings set org.gnome.desktop.interface gtk-theme 'Yaru' \
&& gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 10' \
&& gsettings set org.gnome.desktop.interface document-font-name 'JetBrains Mono 10' \
&& gsettings set org.gnome.desktop.interface font-name 'JetBrains Mono 10' \
&& gsettings set org.gnome.shell.extensions.dash-to-dock autohide false \
&& gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false \
&& gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false"

alias install-gitkraken="_ apt-get update -y && _ apt-get -y install python gconf2 gconf-service && \
wget -O /tmp/gitkraken.deb https://release.gitkraken.com/linux/gitkraken-amd64.deb && \
_ dpkg -i /tmp/gitkraken.deb && \
_ apt-get install -f"

alias install-term="_ apt-get update -y && _ apt-get install -y dconf-cli && git clone https://github.com/dracula/gnome-terminal /tmp/drac-term; /tmp/drac-term/install.sh"

# Probs update this frequently
# https://www.jetbrains.com/toolbox/download/download-thanks.html?platform=linux
alias install-jetbrains="wget -O /tmp/jet.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.20.7940.tar.gz && \
tar -xzf /tmp/jet.tar.gz -C /tmp && \
_ mv /tmp/jetbrains-toolbox-*/jetbrains-toolbox /usr/local/bin/"

#_ apt-get install -y libc-ares2 libcrypto++6 libmediainfo0v5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5svg5 libqt5widgets5 libzen0v5 && \
alias install-megasync="_ apt-get update -y && \
wget -O /tmp/megasync.deb https://mega.nz/linux/MEGAsync/x${NAME}_${VERSION_ID}/amd64/megasync-x${NAME}_${VERSION_ID}_amd64.deb && \
_ dpkg -i /tmp/megasync.deb && \
_ apt-get install -f"

alias install-notes="wget -O /tmp/note.snap https://github.com/obsidianmd/obsidian-releases/releases/download/v0.10.13/obsidian_0.10.13_amd64.snap && \
_ snap install --dangerous /tmp/note.snap"

alias install-vim="wget -O ~/.vimrc https://raw.githubusercontent.com/mathiasbynens/dotfiles/main/.vimrc ; mkdir -p ~/.vim/swaps ~/.vim/backups ~/.vim/undo"

# Personal Prefs
alias install-tyler="\
_ apt update \
&& _ apt install -y \
	vim \
	ubuntu-desktop \
	keepassx \
	gnome-tweak-tool \
	clusterssh \
	network-manager-openvpn \
	chrome-gnome-shell \
	network-manager-openvpn-gnome \
&& _ snap install --classic code \
&& _ snap install --classic slack \
&& _ snap install --classic go \
&& _ snap install --classic kubectl \
&& _ snap install --beta authy \
&& _ snap install discord \
&& _ snap install spotify \
&& _ snap install --beta authy \
&& install-gitkraken \
&& install-megasync \
&& install-theme \
&& install-jetbrains \
&& install-notes \
&& install-term"

{"mode":"full","isActive":false}
