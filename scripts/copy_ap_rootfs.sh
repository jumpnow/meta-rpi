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

	if [ ! -b $DEV ]; then
		DEV=/dev/${1}p2

		if [ ! -b $DEV ]; then
			echo "Block device not found: /dev/${1}2 or /dev/${1}p2"
			exit 1
		fi
	fi
fi

echo "Formatting ${DEV} as ext4"
sudo mkfs.ext4 -q -L ROOT ${DEV}

echo "Mounting ${DEV}"
sudo mount ${DEV} /media/card

echo "Extracting ${IMAGE}-image-${MACHINE}.tar.xz to /media/card"
sudo tar --numeric-owner -C /media/card -xJf ${SRCDIR}/${IMAGE}-image-${MACHINE}.tar.xz

echo "Writing ${TARGET_HOSTNAME} to /etc/hostname"
export TARGET_HOSTNAME
sudo -E bash -c 'echo ${TARGET_HOSTNAME} > /media/card/etc/hostname'        

if [ -f ./ap-interfaces ]; then
	echo "Writing ap-interfaces to /media/card/etc/network/interfaces"
	sudo cp ./ap-interfaces /media/card/etc/network/interfaces
fi

if [ -f ./ap-hostapd.conf ]; then
	echo "Writing ap-hostapd.conf to /media/card/etc/hostapd.conf"
	sudo cp ./ap-hostapd.conf /media/card/etc/hostapd.conf
fi

if [ -f ./ap-dnsmasq.conf ]; then
	echo "Writing ap-dnsmasq.conf to /media/card/etc/dnsmasq.conf"
	sudo cp ./ap-dnsmasq.conf /media/card/etc/dnsmasq.conf
fi

if [ -f ./ap-nat.rules ]; then
	echo "Writing ap-nat.rules to /media/card/etc/nat.rules"
	sudo cp ./ap-nat.rules /media/card/etc/nat.rules

	sudo sed -i 's:#net.ipv4.ip_forward=1:net.ipv4.ip_forward=1:' /media/card/etc/sysctl.conf 
	sudo sed -i 's:#up iptables-restore < /etc/nat.rules:up iptables-restore < /etc/nat.rules:' /media/card/etc/network/interfaces
fi

echo "Unmounting ${DEV}"
sudo umount ${DEV}

DEV=/dev/${1}3

if [ -b ${DEV} ]; then
	echo "Formatting partition ${DEV} as ext4"
	sudo mkfs.ext4 -q -L DATA ${DEV}
fi

echo "Done"
