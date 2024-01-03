xcopy /Y ".\src\starship.toml" "%USERPROFILE%\.config"

REM get the $PROFILE variable and copy the powershell-profile.ps1 file to it
REM this is the file that will be executed when PowerShell starts
REM https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.1
xcopy /Y ".\src\powershell-profile.ps1" $PROFILE

echo "Done :^)"