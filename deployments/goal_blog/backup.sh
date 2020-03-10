#!/bin/bash

# set -x

# get vars
source /Users/devgru/code/dgserv3/dgserv-variables.env
BACKUP_DATE=$(date +%F_%H%M%S)
BACKUP_NAME=goalblog.${BACKUP_DATE}.bak

echo "####################################################################################################"
echo "#  ${BACKUP_NAME}"
echo "####################################################################################################"

# tunnel docker socket
echo "Tunneling docker socket..."
unlink /tmp/socket.remote
ssh -i ${DGSERV_KEY} -nNT -L /tmp/socket.remote:/var/run/docker.sock ${DGSERV_USER}@${DGSERV_IP} &
export TUNNEL_PID=$!
export DOCKER_HOST=unix:///tmp/socket.remote
sleep 2

# docker ps

# back up files
echo "Backing up ${BACKUP_NAME}..."
/usr/local/bin/docker cp -a goalblog:/goalblog ./${BACKUP_NAME}
tar -zcvf ${BACKUP_NAME}.tgz ${BACKUP_NAME}
rm -r ${BACKUP_NAME}

# unlink docker socket
kill $TUNNEL_PID
rm -f /tmp/socket.remote

echo "Done"



