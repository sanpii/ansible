#!/bin/sh

DIR=/home/pi/cam

/home/pi/motion -c /etc/motion/motion.conf
while true
do
    DEST="/media/data/camera/cam1/$(date +%Y-%m-%d)"

    ssh sanpi@192.168.1.1 "test -e '$DEST' || mkdir '$DEST'"

    find "$DIR" -name '*.jpg' -exec scp {} sanpi@192.168.1.1:$DEST \; -delete
    sleep 1
done
