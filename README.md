# PalWorld Server Dockerfile
> Forked from [HowTo-PalWorld](https://github.com/A1RM4X/HowTo-Palworld.git)

## Quickstart

- Start a server
```bash
docker run --name <container-name> -d -p 8211:8211/udp sunwoo2539/palserver:latest
```

- Configure settings
```bash
docker exec -it <container-name> nano /home/steam/Steam/steamapps/common/PalServer/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
```
