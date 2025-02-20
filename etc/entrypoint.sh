#!/bin/bash

# Prevent docker volume mounted as `root`
# and read/write permission being denied
sudo chown -R $USER:$USER $HOME

# Return bash shell
/app/palworld-start.sh
