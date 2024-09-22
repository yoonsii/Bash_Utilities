#!/bin/bash

##Script to automatically archive files which are x days old and delete files from archive which
##are y days old

#Set target and backup folders
target_folder="./target"
archive_folder="./target/bak"

age_to_archive=30
age_to_delete=60

#Ensure folders exist

mkdir -p $target_folder
mkdir -p $archive_folder

find $target_folder -maxdepth 1 -type f -mtime +${age_to_archive} -exec echo {} moved to ${archive_folder} >> archiving.log \;
find $target_folder -maxdepth 1 -type f -mtime +${age_to_archive} -exec mv {} ${archive_folder} \;


find $archive_folder -maxdepth 1 -type f -mtime +${age_to_delete} -exec echo {} deleted from archive folder >> archiving.log  \;
find $archive_folder -maxdepth 1 -type f -mtime +${age_to_delete} -exec rm {}  \;

