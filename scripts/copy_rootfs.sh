#!/bin/bash

if [ -z "${MACHINE}" ]; then
	echo "Environment variable MACHINE not set"
	echo "Example: export MACHINE=raspberrypi2 or export MACHINE=raspberrypi"
	exit 1
fi

if [ "${MACHINE}" != "raspberrypi2" ] && [ "${MACHINE}" != "raspberrypi" ]; then
	echo "Invalid MACHINE: ${MACHINE}"
	exit 1
fi

if [ "x${1}" = "x" ]; then
	echo -e "\nUsage: ${0} <block device> [ <image-type> [<hostname>] ]\n"
	exit 0
fi

if [ ! -d /media/card ]; then
	echo "Temporary mount point [/media/card] not found"
	exit 1
fi

if [ "x${2}" = "x" ]; then
        IMAGE=console
else
        IMAGE=${2}
fi

if [ -z "$OETMP" ]; then
	echo -e "\nWorking from local directory"
	SRCDIR=.
else
	echo -e "\nOETMP: $OETMP"

	if [ ! -d ${OETMP}/deploy/images/${MACHINE} ]; then
		echo "Directory not found: ${OETMP}/deploy/images/${MACHINE}"
		exit 1
	fi

	SRCDIR=${OETMP}/deploy/images/${MACHINE}
fi 

echo "IMAGE: $IMAGE"

if [ "x${3}" = "x" ]; then
        TARGET_HOSTNAME=$MACHINE
else
        TARGET_HOSTNAME=${3}
fi

echo -e "HOSTNAME: $TARGET_HOSTNAME\n"


if [ ! -f "${SRCDIR}/${IMAGE}-image-${MACHINE}.tar.xz" ]; then
        echo "File not found: ${SRCDIR}/${IMAGE}-image-${MACHINE}.tar.xz"
        exit 1
fi

if [ -b ${1} ]; then
	DEV=${1}
else
	DEV=/dev/${1}2

	if [ ! -b ${DEV} ]; then
		echo -e "\nBlock device not found: ${DEV}, trying p2\n"
		DEV=/dev/${1}p2

		if [ ! -b ${DEV} ]; then
			echo -e "\nBlock device not found: ${DEV}\n"
			exit 1
		fi
	fi
fi

echo "Formatting ${DEV} as ext4"
sudo mkfs.ext4 -q -L ROOT ${DEV}

echo "Mounting ${DEV}"
sudo mount ${DEV} /media/card

echo "Extracting ${IMAGE}-image-${MACHINE}.tar.xz to /media/card"
sudo tar -C /media/card -xJf ${SRCDIR}/${IMAGE}-image-${MACHINE}.tar.xz

echo "Writing ${TARGET_HOSTNAME} to /etc/hostname"
export TARGET_HOSTNAME
sudo -E bash -c 'echo ${TARGET_HOSTNAME} > /media/card/etc/hostname'        

if [ -f ${SRCDIR}/interfaces ]; then
	echo "Writing interfaces to /media/card/etc/network/"
	sudo cp ${SRCDIR}/interfaces /media/card/etc/network/interfaces
fi

if [ -f ${SRCDIR}/wpa_supplicant.conf ]; then
	echo "Writing wpa_supplicant.conf to /media/card/etc/"
	sudo cp ${SRCDIR}/wpa_supplicant.conf /media/card/etc/wpa_supplicant.conf
fi

echo "Unmounting ${DEV}"
sudo umount ${DEV}

DEV=/dev/${1}3

if [ -b ${DEV} ]; then
	echo "Formatting partition ${DEV} as ext4"
	sudo mkfs.ext4 -q -L DATA ${DEV}
fi

echo "Done"
