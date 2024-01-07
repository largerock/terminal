# add a function to run git status when gst is run
function gst { git status }
function gco { git checkout $args }



oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons

Invoke-Expression (&starship init powershell)