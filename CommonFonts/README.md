# Common Fonts


## Using the Install Script

You can use the install script on most distributions.


Run the install script.
```
sudo bash install.sh
```

## Manual Installation

For this tutorial we will use the `/tmp` directory to temporary save the files.

Change to the `/tmp` directory.
```
cd /tmp
```

Clone the Git repository.

Create a sub directory in your system's fonts directory. This is usually `/usr/share/fonts`, otherwise consult your distribution's documentation.
```
sudo mkdir /usr/share/fonts/common-fonts
```

Move fonts to the new directory.
```
sudo mv ttf-wps-fonts/* /usr/share/fonts/common-fonts
```

Fix the file permissions.
```
sudo chmod 644 /usr/share/fonts/common-fonts/*
```
Rebuild the font cache.
```
sudo fc-cache -vfs
```

Clean up the `tmp` directory.
```
rm -rf /tmp/Commmonfonts
```


