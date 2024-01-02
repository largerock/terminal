# home sweet home
home is where the heart is and this repo makes that process a whole lot easier. todays day and age has us go through 100 different systems from when you wake to when you sleep so this is a one stop shop for setting up all the nice-to-haves and cool-stuffs in the terminal. follow the simple steps for setup and you'll have a basic setup of oh-my-zsh and starship on linux / macos & powershell / startship on windows. 

if you're unsure you want to make the changes, please save copies of your current configs (.zshrc .zprofile etc..) for future reference or backup.

this was good to read: https://medium.com/@selvamraju007/customize-your-terminal-using-ohmyzsh-agnoster-theme-1f0bc50716ef#:~:text=Configure%20Agnoster%20theme&text=For%20this%2C%20you%20first%20need,icons%20used%20by%20the%20theme.&text=After%20installing%20the%20font%2C%20you,zshrc%20configuration%20file.


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