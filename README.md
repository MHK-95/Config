# config
This repository sets up my personal configuration for my Ubuntu 18 LTS machines. Anyone is free to see and use anything written here.

I store the bash scripts that configure my system ins the bash_scripts directory. I use the master_script.sh to run these bash scripts in a procedural manner. I do check the exit codes for errors and will exit the scripts if an error occurs. These are usually networking errors. You can simply run master_script.sh again if an error occurs.

Simply run the master_script.sh with root privileges on a Ubuntu 18 LTS machine to configure the system.
```
$ sudo ./master_script.sh
```

