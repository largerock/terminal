# add a function to run git status when gst is run
function gst { git status }
function gco { git checkout $args }

Invoke-Expression (&starship init powershell)
