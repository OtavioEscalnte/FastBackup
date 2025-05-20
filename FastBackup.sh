#!/bin/bash

# Author: Otávio Escalante

# Description: Script to automate backup using compression

echo " ███████╗ █████╗ ███████╗████████╗██████╗  █████╗  ██████╗██╗  ██╗██╗   ██╗██████╗ "
echo " ██╔════╝██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║   ██║██╔══██╗"
echo " █████╗  ███████║███████╗   ██║   ██████╔╝███████║██║     █████╔╝ ██║   ██║██████╔╝"
echo " ██╔══╝  ██╔══██║╚════██║   ██║   ██╔══██╗██╔══██║██║     ██╔═██╗ ██║   ██║██╔═══╝ "
echo " ██║     ██║  ██║███████║   ██║   ██████╔╝██║  ██║╚██████╗██║  ██╗╚██████╔╝██║     "
echo " ╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     "
                                                                                  


source=$1
destination=$2
date=$(date +%d-%m-%Y-%H-%M)
file="backup_$date.tar.bz2"
log="backup.log"

if [[ -z $source || -z $destination ]]; then
	echo "usage: $0 /path/source /path/destination"
	
	exit 1
fi

if [[ ! -d $source ]]; then
	echo "[ERROR] Source directory does not exist"
	
	exit 2
fi


mkdir -p "$destination"


echo "[+] Initializing backup from $source to $destination."

tar -cjf "$destination/$file" "$source" 2>> "$log"

if [[ $? -eq 0 ]]; then
	echo "[+] Backup was successfully created at: $destination/$file"
	echo "$(date) - Success finish in $destination/$file" >> "$log"
else
	echo "[ERROR] Backup failed."
	echo "$(date) - Backup of folder $source failed" >> "$log"
fi
