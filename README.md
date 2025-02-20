# PalWorld Server Dockerfile
> Referenced [HowTo-PalWorld](https://github.com/A1RM4X/HowTo-Palworld.git)

## Quickstart

1. Set data directory home
> Set world data backup folder.
> Change anywhere you want to save the world file into
```bash
export PALSERVER_HOME="$HOME/.local/backup/PalWorld"
echo $PALSERVER_HOME
```

2. Start a server
> replace `palworld-server-docker` with desired docker name
```bash
docker run -d \
  -p 8211:8211/udp \
  --name palworld-server-docker \
  --volume $PALSERVER_HOME/Pal:/home/steam/Steam/steamapps/common/PalServer/Pal \
  sunwoo2539/palserver:latest
```

3. Configure settings
```bash
nano $PALSERVER_HOME/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
# Restart docker to apply changes
docker restart palworld-server-docker
```

## Supported architectures
- amd64
