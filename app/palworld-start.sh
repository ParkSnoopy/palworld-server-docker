#!/bin/bash

# update server
DIR=$( dirname "$(realpath $0)" )
$DIR/palworld-update.sh

$PALSERVER_HOME/PalServer.sh --userperfthreads --NoAsyncLoadingThread --UseMultithreadForDS
