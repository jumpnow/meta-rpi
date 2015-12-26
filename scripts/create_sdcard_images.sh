#!/bin/bash

DSTDIR=~/rpi/download
IMG=qt5-x11
IMG_LONG="${IMG}-image-${MACHINE}"
HOSTNAME=rpi2

get_version()
{
	local fullpath=`ls ${SRCDIR}/${IMG_LONG}-*.rootfs.tar.bz2`
	local version=`basename $fullpath .rootfs.tar.bz2 | awk -F'-' '{ print $5 }'`	
	VERSION=$version	
}

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
	
if [ -z "${OETMP}" ]; then
	echo "OETMP environment variable not set"
	exit 1
fi

if [ -z "${MACHINE}" ]; then
	echo "MACHINE environment variable not set"
	exit 1
fi

if [ "${MACHINE}" = "raspberrypi2" ]; then
	MACH="rpi2"
elif [ "${MACHINE}" = "raspberrypi" ]; then
	MACH="rpi"
else
	echo "Invalid MACHINE: ${MACHINE}"
	exit 1
fi

SRCDIR=${OETMP}/deploy/images/${MACHINE}

if [ ! -f "${SRCDIR}/${IMG_LONG}.tar.bz2" ]; then
	echo "File not found: ${SRCDIR}/${IMG_LONG}.tar.bz2"
	exit 1
fi

get_version

echo -e "\n***** Zeroing the 2GB SD card *****\n"
sudo dd if=/dev/zero of=/dev/${DEV} bs=1M count=1800 

echo -e "\n***** Partitioning the SD card *****\n"
sudo ./mk2parts.sh ${DEV} 

echo -e "\n***** Copying the boot partition *****\n"
./copy_boot.sh ${DEV} 

echo -e "\n***** Copying the installer rootfs *****\n"
./copy_rootfs.sh ${DEV} ${IMG} ${HOSTNAME} 

sleep 5

echo -e "\n***** Copying the SD card image *****\n"
sudo dd if=/dev/${DEV} of=${DSTDIR}/${IMG}-${MACH}-${VERSION}.img bs=1M

echo -e "\n***** Compressing the SD card image *****\n"
sudo xz -9 ${DSTDIR}/${IMG}-${MACH}-${VERSION}.img

echo -e "\n***** Creating an md5sum *****\n"
md5sum ${DSTDIR}/${IMG}-${MACH}-${VERSION}.img.xz > ${DSTDIR}/${IMG}-${MACH}-${VERSION}.img.xz.md5

echo -e "\n***** Done *****\n"
