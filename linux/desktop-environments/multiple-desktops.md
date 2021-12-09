## Restore Default Desktop Environment in Ubuntu

Source: https://askubuntu.com/questions/711991/how-to-completely-restore-default-desktop-environment-in-ubuntu-14-04-lts-after

    sudo apt-get purge gnome
    sudo apt-get update
    sudo apt-get install --reinstall ubuntu-desktop  
    sudo reboot  

To remove plasma desktop and reinstall ubuntu-desktop:

    sudo apt-get purge plasma-desktop
    sudo apt-get update
    sudo apt-get install --reinstall ubuntu-desktop^
    sudo reboot  

## Install multiple desktops

Source: https://askubuntu.com/questions/228503/is-it-possible-to-use-multiple-desktop-environments-on-same-system

    sudo apt-get install --no-install-recommends $desktop_package

[The 8 Best Ubuntu Desktop Environments (20.04 Focal Fossa Linux)](https://linuxconfig.org/the-8-best-ubuntu-desktop-environments-20-04-focal-fossa-linux):
- Gnome: `ubuntu-desktop^`. Prereq: `gnome-session gdm3`
- KDE, see [howto](https://itsfoss.com/install-kde-on-ubuntu/)
  - KDE Full. `kde-full`
  - KDE Stardard. `kde-standard`. Plasma desktop with standard set of KDE apps. 
  - KDE Plasma Desktop. `kde-plasma-desktop`. Plasma desktop and a minimal set of KDE applications. 
  - `kubuntu-desktop^`, `kubuntu-full^`. 
- Mate: `ubuntu-mate-desktop^` or `ubuntu-mate-core^`
- Budgie: `ubuntu-budgie-desktop^`
- Xfce/Xubuntu: `xubuntu-desktop^` or `xubuntu-core^`
- Cinnamon: `cinnamon-desktop-environment`
- GNOME Flashback: `gnome-session-flashback`
- LXQt: `lxqt sddm`

