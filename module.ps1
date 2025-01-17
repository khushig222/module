# Function to install and import a PowerShell module
function Install-Import-Module {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ModuleName
    )

    # Install the module if it is not installed
    if (-not (Get-InstalledModule -Name $ModuleName -ErrorAction SilentlyContinue)) {
        Write-Host "Installing module: $ModuleName"
        Install-Module -Name $ModuleName -Force -Scope CurrentUser
    } else {
        Write-Host "Module $ModuleName is already installed."
    }

    # Import the module
    Write-Host "Importing module: $ModuleName"
    Import-Module -Name $ModuleName -Force
}

# Function to list commands in a module
function Get-ModuleCommands {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ModuleName
    )

    # Get all commands in the specified module
    $commands = Get-Command -Module $ModuleName
    if ($commands) {
        Write-Host "Commands in module '$ModuleName':"
        $commands | ForEach-Object { $_.Name }
    } else {
        Write-Host "No commands found in the module '$ModuleName'."
    }
}

# Example 
$module = "WinRm"  
Install-Import-Module -ModuleName $module
Get-ModuleCommands -ModuleName $module
