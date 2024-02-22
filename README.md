# home sweet home

justdoit
```bash
# Get the general config
sudo apt update -y && \
sudo apt install -y git && \
git clone https://github.com/largerock/terminal.git ~/.geroge_terminal; \
sudo -E ~/.geroge_terminal/script/bootstrap.sh && \
~/.geroge_terminal/script/install.sh && \
~/.geroge_terminal/script/test
```


```bash
// windows .bat equivalents in same dir (warn they are WIP)
./script/bootstrap.bat
./script/install.bat
```

### QA
what is this? 
>setup for terminal on all platforms. defaults to using zsh on unix and oh-my-posh on windows with starship as a config ontop of it

this was good to read: 
https://medium.com/@selvamraju007/customize-your-terminal-using-ohmyzsh-agnoster-theme-1f0bc50716ef#:~:text=Configure%20Agnoster%20theme&text=For%20this%2C%20you%20first%20need,icons%20used%20by%20the%20theme.&text=After%20installing%20the%20font%2C%20you,zshrc%20configuration%20file.
https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal
