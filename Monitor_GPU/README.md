# Intro
This file is for monitoring the GPUs out of maximizing the utility of the GPUs on server.

# usage of [monitor_GPU.sh](./monitor_GPU.sh)

This shell script can monitor the status of GPUs and execute the [`test.sh`](https://github.com/sdsy888/MineScript/blob/ee39f8a8a6d5c468bbdd492363a7ba42840a90f7/Monitor_GPU/monitor_GPU.sh#L57) given in the [`#57`](https://github.com/sdsy888/MineScript/blob/ee39f8a8a6d5c468bbdd492363a7ba42840a90f7/Monitor_GPU/monitor_GPU.sh#L57) of the script.

- This script will send the #ID of availabel GPU to [`test.sh`](./test.sh)
- You can do whatever you want in the "test.sh". See the [`test.sh`](./test.sh) file for details.
- Example
```
sh ./monitor_GPU.sh
```
