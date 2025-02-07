# PalWorld Server Dockerfile
> Forked from [HowTo-PalWorld](https://github.com/A1RM4X/HowTo-Palworld.git)

## Quickstart

- Start a server
> replace `palworld-server-docker` with desired docker name
```bash
docker run --name palworld-server-docker -d -p 8211:8211/udp sunwoo2539/palserver:latest
```

- Configure settings
```bash
docker exec -it palworld-server-docker nano /home/steam/Steam/steamapps/common/PalServer/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
docker restart palworld-server-docker
```
