# Automatic Package Updating

The script simply checks if more than `N` number of days has elapsed since the update through the script was run last.
If more than `N` days has elapsed, it runs the command
```bash
sudo apt update && sudo apt upgrade -y
```
which updates the packages on the system.

This is meant to be used as a cron job with the following line
```
@reboot <path to script>
```
which will run the script upon every startup of the machine.
