## Windows Store Apps

    Get-AppxPackages
  
### How to start store app from command line

- `Get-AppxPackages > apps.txt`
- Find in apps.txt target app, check InstallLocation.
- Check `InstallLocation` directory, `AppxManifest.xml`.
- Command: `explorer.exe shell:appsFolder\<Name>_<HashFromAppFolderName>!App`, example: `explorer.exe shell:appsFolder\Microsoft.BingWeather_8wekyb3d8bbwe!App`

## How to make SUBST mapping persistent across reboots?

https://superuser.com/questions/29072/how-to-make-subst-mapping-persistent-across-reboots

```
REGEDIT4 

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices] 
"Z:"="\\??\\C:\\Documents and Settings\\All Users\\Shared Documents"
```
