#!/bin/bash

DSTDIR=~/rpi/upload
IMG=qt5
IMG_LONG="${IMG}-image-${MACHINE}"

if [ "x${1}" = "x" ]; then
	echo "Usage: ${0} <block device>"
	exit 1
fi

if [ "${1}" = "sda" ]; then
	echo "Sorry, not going to work on /dev/sda"
	exit 1
fi

DEV=${1}

if [ ! -b /dev/${DEV} ]; then
	echo "Block device not found: /dev/${DEV}"
	exit 1
fi

if [ "x${2}" = "x" ]; then
	CARDSIZE=2
else
	if [ "${2}" -eq 2 ]; then
		CARDSIZE=2
	elif [ "${2}" -eq 4 ]; then
		CARDSIZE=4
	elif [ "${2}" -gt 4 ]; then
		CARDSIZE=8
	else
		echo "Unsupported card size: ${2}"
		exit 1
	fi
fi

if [ -z "${OETMP}" ]; then
	echo "OETMP environment variable not set"
	exit 1
fi

if [ -z "${MACHINE}" ]; then
	echo "MACHINE environment variable not set"
	exit 1
fi

if [ "${MACHINE}" = "raspberrypi2" ]; then
	MACH="rpi3"
elif [ "${MACHINE}" = "raspberrypi" ]; then
	MACH="rpi"
else
	echo "Invalid MACHINE: ${MACHINE}"
	exit 1
fi

HOSTNAME=${MACH}

SRCDIR=${OETMP}/deploy/images/${MACHINE}

if [ ! -f "${SRCDIR}/${IMG_LONG}.tar.xz" ]; then
	echo "File not found: ${SRCDIR}/${IMG_LONG}.tar.xz"
	exit 1
fi

if [ "${CARDSIZE}" -eq 8 ]; then
	echo -e "\n***** Zeroing 8GB of the SD card *****\n"
	sudo dd if=/dev/zero of=/dev/${DEV} bs=1M count=7400
elif [ "${CARDSIZE}" -eq 4 ]; then
	echo -e "\n***** Zeroing 4GB of the SD card *****\n"
	sudo dd if=/dev/zero of=/dev/${DEV} bs=1M count=3600
elif [ "${CARDSIZE}" -eq 2 ]; then
	echo -e "\n***** Zeroing 2GB of the SD card *****\n"
	sudo dd if=/dev/zero of=/dev/${DEV} bs=1M count=1800
else
	echo "Unsupported card size: ${CARDSIZE}"
	exit 1
fi

echo -e "\n***** Partitioning the SD card *****"
sudo ./mk2parts.sh ${DEV} 

echo -e "\n***** Copying the boot partition *****"
./copy_boot.sh ${DEV} 

echo -e "\n***** Copying the rootfs *****"
./copy_rootfs.sh ${DEV} ${IMG} ${HOSTNAME} 

sleep 5

echo -e "\n***** Copying the SD card image *****\n"
FULL_NAME=${IMG}-${MACH}-${CARDSIZE}gb.img

sudo dd if=/dev/${DEV} of=${DSTDIR}/${FULL_NAME} bs=1M

echo -e "\n***** Compressing the SD card image *****"
sudo xz -9 ${DSTDIR}/${FULL_NAME}

echo -e "\n***** Creating an md5sum *****"
cd ${DSTDIR}
md5sum ${FULL_NAME}.xz > ${FULL_NAME}.xz.md5
cd ${OLDPWD}

echo -e "\n***** Done *****\n"
