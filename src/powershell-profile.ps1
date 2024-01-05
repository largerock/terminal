# add a function to run git status when gst is run
function gst { git status }
function gco { git checkout $args }


Import-Module -Name Terminal-Icons

oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression

Invoke-Expression (&starship init powershell)