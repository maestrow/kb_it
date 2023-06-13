---
url: https://www.guyrutenberg.com/2021/11/14/use-alt-shift-for-keyboard-layout-switching-in-gnome-40/
date: 2021-11-14
---

# Use Alt-Shift for keyboard layout switching in GNOME 40

Since GNOME 40 the keyboard layout indicator doesn’t work if the keyboard is switched using a key combination defined in GNOME Tweaks. The indicator does work for key combinations defined through GNOME Setting’s Keyboard Shortcut settings. However, GNOME Settings doesn’t allow one to set Alt+Shift as the key combination layout switching, as it seems to require at least one non-modifier key in every shortcut. This limitation only exists in GNOME Settings GUI and you can work around it by defining the shortcut using gsettings:

    $ gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
    $ gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
