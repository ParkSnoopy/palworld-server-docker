FROM sunwoo2539/steamcmd-nonroot:debian-12

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
