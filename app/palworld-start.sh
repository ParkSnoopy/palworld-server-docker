#!/bin/bash

# update server
DIR=$( dirname "$(realpath $0)" )
$DIR/palworld-update.sh

/home/steam/Steam/steamapps/common/PalServer/PalServer.sh --userperfthreads --NoAsyncLoadingThread --UseMultithreadForDS
