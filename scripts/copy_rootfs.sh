#!/bin/bash

if [ -z "${MACHINE}" ]; then
   # try to find it
    if [ -f ../../build/conf/local.conf ]; then
        MACHINE=$(grep '^MACHINE' ../../build/conf/local.conf | grep -v MACHINE_ | awk '{ print $3 }' | sed 's/"//g')
    fi

    if [ -z "${MACHINE}" ]; then
        echo "Environment variable MACHINE not set"
        echo "Example: export MACHINE=raspberrypi4|raspberrypi3|raspberrypi0-wifi"
        exit 1
    fi
fi

if [ "x${1}" = "x" ]; then
    echo -e "\nUsage: ${0} <block device> [ <image-type> [<hostname>] ]\n"
    exit 0
fi

mount | grep '^/' | grep -q ${1}

if [ $? -ne 1 ]; then
    echo "Looks like partitions on device /dev/${1} are mounted"
    echo "Not going to work on a device that is currently in use"
    mount | grep '^/' | grep ${1}
    exit 1
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
    # echo try to find it
    if [ -f ../../build/conf/local.conf ]; then
        OETMP=$(grep '^TMPDIR' ../../build/conf/local.conf | awk '{ print $3 }' | sed 's/"//g')
    fi

    if [ -z "$OETMP" ]; then
        if [ -d "../../build/tmp" ]; then
            OETMP="../../build/tmp"
        fi
    fi
fi

if [ -z "$OETMP" ]; then
    echo "Environment variable OETMP not found"
    exit 1
else
    if [ ! -d ${OETMP}/deploy/images/${MACHINE} ]; then
        echo "Directory not found: ${OETMP}/deploy/images/${MACHINE}"
        exit 1
    fi

    SRCDIR=${OETMP}/deploy/images/${MACHINE}
fi

if [ "x${3}" = "x" ]; then
    TARGET_HOSTNAME=$MACHINE
else
    TARGET_HOSTNAME=${3}
fi

echo "MACHINE: $MACHINE"
echo "OETMP: $OETMP"
echo "IMAGE: $IMAGE"
echo "HOSTNAME: $TARGET_HOSTNAME"


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

if [ "$?" -ne 0 ]; then
    echo "Error formatting ${DEV} as ext4"
    exit 1
fi

echo "Mounting ${DEV}"
sudo mount ${DEV} /media/card

if [ "$?" -ne 0 ]; then
    echo "Error mounting ${DEV} at /media/card"
    exit 1
fi

echo "Extracting ${IMAGE}-image-${MACHINE}.tar.xz to /media/card"
sudo tar --numeric-owner -C /media/card -xJf ${SRCDIR}/${IMAGE}-image-${MACHINE}.tar.xz

echo "Generating a random-seed for urandom"
mkdir -p /media/card/var/lib/urandom
sudo dd if=/dev/urandom of=/media/card/var/lib/urandom/random-seed bs=512 count=1
sudo chmod 600 /media/card/var/lib/urandom/random-seed

echo "Writing ${TARGET_HOSTNAME} to /etc/hostname"
export TARGET_HOSTNAME
sudo -E bash -c 'echo ${TARGET_HOSTNAME} > /media/card/etc/hostname'

if [ -f ${SRCDIR}/interfaces ]; then
    echo "Writing interfaces to /media/card/etc/network/"
    sudo cp ${SRCDIR}/interfaces /media/card/etc/network/interfaces
elif [ -f ./interfaces ]; then
    echo "Writing ./interfaces to /media/card/etc/network/"
    sudo cp ./interfaces /media/card/etc/network/interfaces
fi

if [ -f ${SRCDIR}/wpa_supplicant.conf ]; then
    echo "Writing wpa_supplicant.conf to /media/card/etc/"
    sudo cp ${SRCDIR}/wpa_supplicant.conf /media/card/etc/wpa_supplicant.conf
elif [ -f ./wpa_supplicant.conf ]; then
    echo "Writing ./wpa_supplicant.conf to /media/card/etc/"
    sudo cp ./wpa_supplicant.conf /media/card/etc/wpa_supplicant.conf
fi

echo "Unmounting ${DEV}"
sudo umount ${DEV}

DEV=/dev/${1}3

if [ -b ${DEV} ]; then
    echo "Formatting partition ${DEV} as ext4"
    sudo mkfs.ext4 -q -L DATA ${DEV}
fi

echo "Done"
