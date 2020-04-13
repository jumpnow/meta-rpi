#!/bin/bash

function ver() {
	printf "%03d%03d%03d" $(echo "$1" | tr '.' ' ')
}

if [ -n "$1" ]; then
	DRIVE=/dev/$1
else
	echo -e "\nUsage: sudo $0 <device>\n"
	echo -e "Example: sudo $0 sdb\n"
	exit 1
fi

mount | grep '^/' | grep -q ${1}

if [ $? -ne 1 ]; then
    echo "Looks like partitions on device /dev/${1} are mounted"
    echo "Not going to work on a device that is currently in use"
    mount | grep '^/' | grep ${1}
    exit 1
fi

echo -e "\nWorking on $DRIVE\n"

# new versions of sfdisk don't use rotating disk params
sfdisk_ver=`sfdisk --version | awk '{ print $NF }'`

if [ $(ver $sfdisk_ver) -lt $(ver 2.26.2) ]; then
	SIZE=`fdisk -l $DRIVE | grep "$DRIVE" | cut -d' ' -f5 | grep -o -E '[0-9]+'`

	if [ "$SIZE" -lt 3800000000 ]; then
		echo Card size is $SIZE bytes
		echo "Require an SD card of at least 4GB"
		exit 1
	fi

	CYLINDERS=`echo $SIZE/255/63/512 | bc`
	echo "CYLINDERS – $CYLINDERS"
	SFDISK_CMD="sfdisk --force -D -uS -H255 -S63 -C ${CYLINDERS}"
else
	SFDISK_CMD="sfdisk"
fi

echo -e "\nOkay, here we go ...\n"

echo -e "=== Zeroing the MBR ===\n"
dd if=/dev/zero of=$DRIVE bs=1024 count=1024

# 3 partitions
# Sectors are 512 bytes
# 0      : 4MB, no partition, MBR then empty
# 8192   : 64 MB, FAT partition, bootloader, kernel 
# 139264 : 2GB, linux partition, root filesystem
# 2236416: 2GB+, linux partition, no assigned use

echo -e "\n=== Creating 3 partitions ===\n"
{
echo 8192,131072,0x0C,*
echo 139264,4194304,0x83,-
echo 4333568,+,0x83,-
} | $SFDISK_CMD $DRIVE


sleep 1

echo -e "\n=== Done! ===\n"

