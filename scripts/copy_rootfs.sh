#!/bin/bash

mnt=/mnt

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

mount | grep '^/' | grep -q "$1"

if [ $? -ne 1 ]; then
    echo "Looks like partitions on device /dev/${1} are mounted"
    echo "Not going to work on a device that is currently in use"
    mount | grep '^/' | grep "$1"
    exit 1
fi

if [ ! -d "$mnt" ]; then
    echo "Temporary mount point [ $mnt ] not found"
    exit 1
fi

if [ "x${2}" = "x" ]; then
    IMAGE=console
else
    IMAGE="$2"
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

    src=${OETMP}/deploy/images/${MACHINE}
fi

if [ "x${3}" = "x" ]; then
    target_hostname=$MACHINE
else
    target_hostname=${3}
fi

echo "MACHINE: $MACHINE"
echo "OETMP: $OETMP"
echo "IMAGE: $IMAGE"
echo "HOSTNAME: $target_hostname"


if [ ! -f "${src}/${IMAGE}-image-${MACHINE}.tar.xz" ]; then
    echo "File not found: ${src}/${IMAGE}-image-${MACHINE}.tar.xz"
    exit 1
fi

if [ -b "$1" ]; then
    dev="$1"
else
    dev="/dev/${1}2"

    if [ ! -b "$dev" ]; then
        dev="/dev/${1}p2"

        if [ ! -b "$dev" ]; then
            echo "Block device not found: /dev/${1}2 or /dev/${1}p2"
            exit 1
        fi
    fi
fi

echo "Formatting $dev as ext4"
sudo mkfs.ext4 -q -L ROOT "$dev"

if [ "$?" -ne 0 ]; then
    echo "Error formatting $dev as ext4"
    exit 1
fi

echo "Mounting $dev"
sudo mount "$dev" "$mnt"

if [ "$?" -ne 0 ]; then
    echo "Error mounting ${dev} at /media/card"
    exit 1
fi

echo "Extracting ${IMAGE}-image-${MACHINE}.tar.xz to $mnt"
sudo tar --numeric-owner -C "$mnt" -xJf ${src}/${IMAGE}-image-${MACHINE}.tar.xz

echo "Generating a random-seed for systemd-random-seed"
sudo mkdir -p "${mnt}/var/lib/systemd"
sudo dd status=none if=/dev/urandom of="${mnt}/var/lib/systemd/random-seed" bs=512 count=1
sudo chmod 600 "${mnt}/var/lib/systemd/random-seed"

echo "Writing ${target_hostname} to ${mnt}/etc/hostname"
export mnt
export target_hostname
sudo -E bash -c 'echo ${target_hostname} > ${mnt}/etc/hostname'

if [ -f "${src}/wpa_supplicant.conf" ]; then
    echo "Writing wpa_supplicant.conf to ${mnt}/etc/"
    sudo cp "${src}/wpa_supplicant.conf" "${mnt}/etc/wpa_supplicant.conf"
elif [ -f ./wpa_supplicant.conf ]; then
    echo "Writing ./wpa_supplicant.conf to ${mnt}/etc/"
    sudo cp ./wpa_supplicant.conf "${mnt}/etc/wpa_supplicant.conf"
fi

echo "Unmounting $dev"
sudo umount "$dev"

echo "Done"
