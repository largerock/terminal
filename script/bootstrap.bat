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

    @REM enable this if we want to install from an admin console. last method is untested wtih current changes
    @REM Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
)

choco feature enable -n allowGlobalConfirmation

Install-Module -Name Terminal-Icons -Repository PSGallery

echo Installing packages...
@REM Rustlang.Rustup            - Rust programming language
winget install Git.Git Starship.Starship Microsoft.VisualStudioCode Google.Chrome OpenJS.NodeJS   -e
echo Packages installed successfully.

