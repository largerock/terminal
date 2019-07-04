# New Linux OS setup
For setting up a new ubuntu whatevernumber environment.
Follow the steps below & have fun

### 1: Clone the repo & run the install scripts
```bash
sudo apt update -y && \
sudo apt install -y git && \
git clone https://github.com/largerock/zsh.git ~/repos \
sudo -E ~/repos/script/install
```

### 2: Install & Setup the essentials
After isntalling ZSH and setting the sournce you now have access to the alias'.
You can use this one to install some useful programs
```bash
install-base
```

It will install the following
- vim
- ubuntu-desktop
- keepassx
- gnome-tweak-tool
- clusterssh
- fonts-firacode
- chrome-gnome-shell

Stolened from this handsome chap: https://github.com/tyhal/zsh
(Changes made to be more global and add more alias)