# Intro
This file is for monitoring the GPUs out of maximizing the utility of the GPUs on server.

# usage of [monitor_GPU.sh](./monitor_GPU.sh)

This shell script can monitor the status of GPUs and execute the "test.sh" given in the #57 of the script.

- This script will send the #ID of availabel GPU to `test.sh`
- You can do whatever you want in the "test.sh". See the `test.sh` file for details.
- Example
```
sh ./monitor_GPU.sh
```
