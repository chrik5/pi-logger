#!/bin/bash

# define some variables
NEWFILE=" "
CURFILE=" "
FPATH="/media/usb/"

#CURFILE="$(ls -t $FPATH*.csv | head -1)"

while true ; do 
    
   echo $CURFILE   

   NEWFILE="$(ls -t $FPATH*.csv | head -1)"

    echo $NEWFILE   
        
    if [ "$NEWFILE" != "$CURFILE" ]; then
        CURFILE=$NEWFILE
        killall websocketd 
        /home/pi/websocketd/websocketd --port=8080 --staticdir=/home/pi/websocketd/www tail -f $CURFILE &
    fi
    
    sleep 5
done
