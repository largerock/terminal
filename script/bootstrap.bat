@echo off
SET "ChocolateyInstall=C:\ProgramData\chocolatey"
SET "PATH=%ChocolateyInstall%\bin;%PATH%"

REM Check if Chocolatey is already installed
choco -? >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Chocolatey is already installed.
) ELSE (
    echo Installing Chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    echo Chocolatey installed successfully.
)

choco feature enable -n allowGlobalConfirmation

@REM install oh-my-posh
winget install JanDeDobbeleer.OhMyPosh
Install-Module -Name Terminal-Icons -Repository PSGallery



echo Installing packages...
choco install git rust starship vscode telegram.install googlechrome nodejs --yes
echo Packages installed successfully.

