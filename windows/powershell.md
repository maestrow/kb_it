## Modules

https://www.powershellgallery.com

install:

    Install-Module
    
get list:

    Get-Module -ListAvailable
    Get-Module                     # Get Loaded

load:

    Import-Module -Name PSDiagnostics
    Import-Module "path/to/module.ps1"