# Config
This repository sets up my personal configuration for my Ubuntu 18 LTS machines. Anyone is free to see and use anything written here.

These scripts will install the software I want, make symlinks to my config dotfiles, and configure GNOME.

I store the bash scripts that configure my system in the bash_scripts directory. I use the master_script-root.sh and master_script-user.sh to run these bash scripts in a procedural manner. I do check the exit codes for errors and will exit the scripts if an error occurs. These are usually networking errors. You can simply run master scripts again if an error occurs.

There are two master scripts, one that run scripts that require root privileges and one that run scripts that don't need root privileges. I initially wanted one master script that run all the bash scripts, but could not get the "su -l $USER" command to work correctly with gsettings and flatpak.

First, simply run the master_script-root.sh with sudo.
```
$ sudo ./master_script-root.sh
```

Then, run the master-script-user as a normal user.
```
$ ./master_script-user.sh
```

The system needs to be rebooted for some of the changes to take place, like the favorite apps to be added to GNOME Dash.
