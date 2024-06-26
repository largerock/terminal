@echo off

:: Function to install OpenSSH Server
:install_ssh
echo Installing OpenSSH Server...
dism /online /Add-Capability /CapabilityName:OpenSSH.Server~~~~0.0.1.0

echo Starting SSH Server...
net start sshd

echo Setting SSH Server to start automatically...
sc config sshd start=auto

echo Allowing SSH through Windows Firewall...
netsh advfirewall firewall add rule name="OpenSSH Server" dir=in action=allow protocol=TCP localport=22

echo OpenSSH Server setup complete.
goto :eof

:: Function to allow ICMP (ping) traffic through Windows Firewall
:allow_ping
echo Allowing ICMP (ping) traffic through Windows Firewall...
netsh advfirewall firewall add rule name="Allow ICMPv4-In" protocol=icmpv4:8,any dir=in action=allow
netsh advfirewall firewall add rule name="Allow ICMPv6-In" protocol=icmpv6:8,any dir=in action=allow

echo ICMP (ping) traffic allowed through the firewall.
goto :eof

:: Function to install Chocolatey
:install_choco
echo Checking for Chocolatey installation...
choco -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    echo Chocolatey installed successfully.
) else (
    echo Chocolatey is already installed.
)
goto :eof

:: Main script execution
echo Starting setup...

call :install_choco
call :install_ssh
call :allow_ping

echo Setup complete. OpenSSH Server is installed and running, ICMP (ping) traffic is allowed, and Chocolatey is installed.
pause