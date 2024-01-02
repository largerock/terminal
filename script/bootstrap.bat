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

REM install git (check if it is already installed)
echo Installing Git...
choco install git -y
echo Git installed successfully.

REM install rust and cargo
echo Installing Rust...
choco install rust cargo -y
echo Rust installed successfully.

REM install starship prompt
echo Installing Starship Prompt...
choco install starship -y
echo Starship Prompt installed successfully.