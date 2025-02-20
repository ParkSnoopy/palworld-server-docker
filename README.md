# PalWorld Server Dockerfile
> Forked from [HowTo-PalWorld](https://github.com/A1RM4X/HowTo-Palworld.git)

## Quickstart

- Start a server
> replace `palworld-server-docker` with desired docker name
```bash
# Set world data backup folder.
# Change anywhere you want to save the world file into
export PALSERVER_HOME="$HOME/.local/backup/PalWorld"
docker run -d \
  -p 8211:8211/udp \
  --name palworld-server-docker \
  --volume $PALSERVER_HOME/Pal:/home/steam/Steam/steamapps/common/PalServer/Pal:Z \
  sunwoo2539/palserver:latest
```

- Configure settings
```bash
nano $PALSERVER_HOME/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
# Restart docker to apply changes
docker restart palworld-server-docker
```

## Supported architectures
- amd64
