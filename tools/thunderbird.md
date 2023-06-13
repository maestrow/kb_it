## Installing on linux 

- [Installing Thunderbird manually](https://support.mozilla.org/en-US/kb/installing-thunderbird-linux#w_installing-thunderbird-manually-for-advanced-users)

1. Go to the [Thunderbird's download page](https://www.thunderbird.net/download/) and click on the Free Download button.

2. Open a terminal and go to the folder where your download has been saved. For example:

`cd ~/Downloads`

3. Extract the contents of the downloaded file by typing:

`tar xjf thunderbird-*.tar.bz2`

4. Move the uncompressed Thunderbird folder to /opt:

`sudo mv thunderbird /opt`

5. Create a symlink to the Thunderbird executable:

`sudo ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird`

6. Download a copy of the desktop file:

`sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/installing-thunderbird-linux/thunderbird.desktop -P /usr/local/share/applications`

To verify that the installation was successful, click the menu button Fx89menuButton, click Help and select More Troubleshooting Information. In the Application Basics section of the Troubleshooting Information page, the value of Application Binary should be `/opt/thunderbird/thunderbird-bin`

```bash
cd ~/Downloads
tar xjf thunderbird-*.tar.bz2
sudo mv thunderbird /opt
sudo ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/installing-thunderbird-linux/thunderbird.desktop -P /usr/local/share/applications
```

## Settings

- https://support.mozilla.org/en-US/kb/customize-date-time-formats-thunderbird
- 