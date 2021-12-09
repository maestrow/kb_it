# How to create application shortcut?

- https://linuxconfig.org/how-to-create-desktop-shortcut-launcher-on-ubuntu-20-04-focal-fossa-linux

`$ gedit ~/Desktop/Skype.desktop`

```
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/snap/bin/skype
Name=Skype
Comment=Skype
Icon=/snap/skype/101/meta/gui/skypeforlinux.png
```

To create shortcut on desktop save *.descktop file to ~/Desktop folder.