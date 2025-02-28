# Using self-modified non-root steam image due to 'Palworld Dedicated Server'
#   does not support running server as user `root`
FROM sunwoo2539/steamcmd-nonroot:debian-12

# Labels
LABEL name="palworld-server-docker"
LABEL version="v0.1.1"
LABEL description="Dedicated PalWorld Server Docker"
LABEL repository="https://github.com/ParkSnoopy/palworld-server-docker.git"
LABEL license="MIT"
LABEL authors="[ ParkSnoopy <117149837+ParkSnoopy@users.noreply.github.com> ]"

# Initialize
USER root

# Set environment
ENV USER="steam"
ENV HOME="/home/steam"
ENV PALSERVER_HOME="/home/steam/.local/share/Steam/steamapps/common/PalServer"

WORKDIR $HOME

# Specify port
EXPOSE 8211/udp

# Copy scripts to container
RUN \
	mkdir -p $PALSERVER_HOME &&\
	mkdir -p $PALSERVER_HOME/Pal/Saved/Config/LinuxServer/

COPY ./app/ /app/
COPY ./etc/PalWorldSettings.ini $PALSERVER_HOME/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini

RUN \
	apt update					&&\
	apt upgrade -y					&&\
	apt install -y --no-install-recommends sudo	&&\
	chown -R $USER:$USER $HOME			&&\
	chown -R $USER:$USER /app/			&&\
	chmod +x /app/*.sh				&&\
	usermod -aG sudo $USER				&&\
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install and run
USER steam
COPY ./etc/entrypoint.sh /usr/bin/entrypoint
ENTRYPOINT ["/usr/bin/entrypoint"]
