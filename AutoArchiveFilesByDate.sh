#!/bin/bash

##Script to automatically archive files which are x days old and delete files from archive which
##are y days old

#Set target and backup folders
TARGET_FOLDER="./target"
ARCHIVE_FOLDER="./target/bak"

AGE_TO_ARCHIVE=30
AGE_TO_DELETE=60

LOG_FILE="archiving.log"

#Ensure folders exist

#mkdir -p $TARGET_FOLDER
#mkdir -p $ARCHIVE_FOLDER

if [ ! -d "${TARGET_FOLDER}" ]; then
	mkdir -p "${TARGET_FOLDER}"
fi

if [ ! -d "${ARCHIVE_FOLDER}" ]; then
	mkdir -p "${ARCHIVE_FOLDER}"
fi

echo "====$(date '+%Y-%m-%d %H:%M:%S')=====" >> ${LOG_FILE} 
echo "Script Starting" >> ${LOG_FILE}

find $TARGET_FOLDER -maxdepth 1 -type f -mtime +${AGE_TO_ARCHIVE} -exec echo {} moved to ${ARCHIVE_FOLDER} >> ${LOG_FILE} \; 

find $TARGET_FOLDER -maxdepth 1 -type f -mtime +${AGE_TO_ARCHIVE} -exec mv {} ${ARCHIVE_FOLDER} \; 

find $ARCHIVE_FOLDER -maxdepth 1 -type f -mtime +${AGE_TO_DELETE} -exec echo {} deleted from archive folder >> ${LOG_FILE} \;

find $ARCHIVE_FOLDER -maxdepth 1 -type f -mtime +${AGE_TO_DELETE} -exec rm {}  \;
echo "Script Finished" >> ${LOG_FILE}

