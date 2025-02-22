# PalWorld Server Dockerfile
> Referenced [HowTo-PalWorld](https://github.com/A1RM4X/HowTo-Palworld.git)

## Quickstart
### TIP: replace `palworld-server-docker` with desired docker name

1. Set data directory home
> Set world data backup folder. <br>
> Change anywhere you want to save the world file into
```bash
export PALSERVER_HOME="$HOME/.local/backup/PalWorld"
echo $PALSERVER_HOME
```

2. Start a server
```bash
docker run -d \
  -p 8211:8211/udp \
  --name palworld-server-docker \
  --volume $PALSERVER_HOME/Pal:/home/steam/.local/share/Steam/steamapps/common/PalServer/Pal \
  sunwoo2539/palserver:latest
```
First run download dedicated server pack from steam, <br>
So, may take some time and bandwidth

3. Configure settings
```bash
nano $PALSERVER_HOME/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
# Restart docker to apply changes
docker restart palworld-server-docker
```

## Supported architectures
- amd64
