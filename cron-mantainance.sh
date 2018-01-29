#!/bin/bash
set -eux

{ echo ""; } | crontab -

OIFS=$IFS;
IFS=",";
if [ -z "$SCHEDULE" ] 
then
echo "SCHEDULE environment not defined! Using 0 0 * * *"
SCHEDULE="0 0 * * *"
fi

if [ ! -z "$DIRS" ] 
then
  for DIR in ${DIRS} 
    do
      COMMAND="db5.3_checkpoint -1 -v -h ${DIR} && db5.3_archive -d -v -h ${DIR}"
      crontab -l | { cat; echo "$SCHEDULE $COMMAND"; } | crontab -
  done
else
  echo "DIRS environment not defined!"
fi
IFS=$OIFS;

cron -f -L /var/log/cron/cron.log "$@"

