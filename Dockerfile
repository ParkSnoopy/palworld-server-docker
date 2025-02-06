FROM ghcr.io/sonroyaalmerol/steamcmd-arm64:steam-bookworm

# specify port
EXPOSE 8211/udp

# update to latest
USER root
RUN apt update && apt upgrade -y

# copy runner scripts to container
COPY ./app/ /app/
COPY ./PalWorldSettings.ini /home/steam/Steam/steamapps/common/PalServer/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
RUN \
	chown -R steam:steam /home/steam/ &&\
	chown -R steam:steam /app/ &&\
	chmod +x /app/palworld-*.sh
USER steam

# install and run
RUN /app/palworld-update.sh
CMD ["/app/palworld-start.sh"]
