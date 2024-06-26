# home sweet home

### Linux
```bash
# Get the general config
sudo apt update -y && \
sudo apt install -y git && \
git clone https://github.com/largerock/terminal.git ~/.george_terminal; \
sudo -E ~/.george_terminal/script/bootstrap.sh && \
~/.george_terminal/script/install.sh && \
~/.george_terminal/script/test
```

### MacOS

*NOTE* you may need to install developer tools first (ssh & git) through invoke in CLI first or other method.
then run this after thats donesies
```bash
# Get the general config
git clone https://github.com/largerock/terminal.git ~/.george_terminal; \
~/.george_terminal/script/bootstrap.sh && \
~/.george_terminal/script/install.sh && \
~/.george_terminal/script/test
```
### Windows

```bash
@echo off
choco install git -y && ^
git clone https://github.com/largerock/terminal.git %USERPROFILE%/.george_terminal && ^
call %USERPROFILE%/.george_terminal/script/bootstrap.bat && ^
echo Repository and bootstrap script executed successfully.
```


To create a similar Windows version that runs the PowerShell scripts in the script folder, follow these steps:

1. Open an admin PowerShell session.
2. Install Chocolatey by running the following command:
    ```
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```
3. Download and install the Agave Nerd Font from https://www.nerdfonts.com/font-downloads.
4. Set the font to `Agave Nerd Font` for the following applications:
    - Visual Studio Code (terminal font: `terminal.integrated.fontFamily`)
    - PowerShell (admin)
    - Windows Terminal
5. Navigate to the script folder in the cloned repository.
6. Run the `bootstrap.bat` and `install.bat` scripts.

This will set up the terminal on Windows using PowerShell scripts.

For more information, you can refer to the following resources:
- [Customize Your Terminal using Oh My Zsh Agnoster Theme](https://medium.com/@selvamraju007/customize-your-terminal-using-ohmyzsh-agnoster-theme-1f0bc50716ef#:~:text=Configure%20Agnoster%20theme&text=For%20this%2C%20you%20first%20need,icons%20used%20by%20the%20theme.&text=After%20installing%20the%20font%2C%20you,zshrc%20configuration%20file.)
- [My Ultimate PowerShell Prompt with Oh My Posh and the Windows Terminal](https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal)
