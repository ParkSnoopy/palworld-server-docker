# PalWorld Server Dockerfile
==Auto updated when every docker start==

<br>

## Quickstart
### TIP: replace `palworld-server-docker` with desired docker name

<br>

1. Set data directory home
> Set world data backup folder. <br>
> Change anywhere you want to save the world file into
```bash
export PALSERVER_HOME="$HOME/.local/backup/PalWorld"
echo $PALSERVER_HOME
```

<br>

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

<br>

3. Configure settings
```bash
nano $PALSERVER_HOME/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
# Restart docker to apply changes
docker restart palworld-server-docker
```

<br><br>

## Supported architectures
- amd64
