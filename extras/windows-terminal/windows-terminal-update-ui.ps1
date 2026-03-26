# Put this file under C:\Users\$USERNAME\scripts
# You need to set `padding` and `scrollbarState` either through the UI or the json file to any value, so that they are present in the `settings.json` before running the script
 
param (
    [Parameter(Mandatory = $true)]
    [string]$Padding,

    [Parameter(Mandatory = $true)]
    [ValidateSet("visible", "hidden", "always")]
    [string]$ScrollbarState
)

$settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

$json = Get-Content $settingsPath -Raw | ConvertFrom-Json

foreach ($profile in $json.profiles.list) {
    if ($profile.name -eq "Ubuntu") {
        $profile.padding = $Padding
        $profile.scrollbarState = $ScrollbarState
    }
}

$json | ConvertTo-Json -Depth 10 | Set-Content $settingsPath -Encoding UTF8
