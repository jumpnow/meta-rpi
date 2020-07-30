#!/bin/bash

KERNEL_IMAGETYPE=zImage

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

echo "MACHINE: ${MACHINE}"

case "${MACHINE}" in
    raspberrypi|raspberrypi0|raspberrypi0-wifi|raspberrypi-cm)
        DTBS="bcm2708-rpi-zero.dtb \
              bcm2708-rpi-zero-w.dtb \
              bcm2708-rpi-b.dtb \
              bcm2708-rpi-b-plus.dtb \
              bcm2708-rpi-cm.dtb"
        ;;

    raspberrypi2|raspberrypi3|raspberrypi-cm3)
        DTBS="bcm2709-rpi-2-b.dtb \
              bcm2710-rpi-3-b.dtb \
              bcm2710-rpi-3-b-plus.dtb \
              bcm2710-rpi-cm3.dtb"
        ;;

    raspberrypi4)
        DTBS="bcm2711-rpi-4-b.dtb"
        ;;

    *)
        echo "Invalid MACHINE: ${MACHINE}"
        exit 1
esac

BOOTLDRFILES="bootcode.bin \
              cmdline.txt \
              config.txt \
              fixup_cd.dat \
              fixup.dat \
              fixup_x.dat \
              start_cd.elf \
              start.elf \
              start_x.elf"

if [ "x${1}" = "x" ]; then
    echo -e "\nUsage: ${0} <block device>\n"
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
    echo "Environment variable OETMP not set"
    exit 1
else
    echo "OETMP: $OETMP"

    if [ ! -d ${OETMP}/deploy/images/${MACHINE} ]; then
        echo "Directory not found: ${OETMP}/deploy/images/${MACHINE}"
        exit 1
    fi

    SRCDIR=${OETMP}/deploy/images/${MACHINE}
fi

for f in ${BOOTLDRFILES}; do
    if [ ! -f ${SRCDIR}/bootfiles/${f} ]; then
        echo "Bootloader file not found: ${SRCDIR}/bootfiles/$f"
        exit 1
    fi
done

have_one_dtb=0
for f in ${DTBS}; do
    if [ -f ${SRCDIR}/${f} ]; then
        have_one_dtb=1
    fi
done

if [ $have_one_dtb -eq 0 ]; then
    echo "No dtb found for this MACHINE $MACHINE and KERNEL_IMAGETYPE $KERNEL_IMAGETYPE"
    exit 1
fi

if [ ! -f ${SRCDIR}/${KERNEL_IMAGETYPE} ]; then
    echo "Kernel file not found: ${SRCDIR}/${KERNEL_IMAGETYPE}"
    exit 1
fi

if [ -b ${1} ]; then
    DEV=${1}
else
    DEV=/dev/${1}1

    if [ ! -b ${DEV} ]; then
        DEV=/dev/${1}p1

        if [ ! -b ${DEV} ]; then
            echo "Block device not found: /dev/${1}1 or /dev/${1}p1"
            exit 1
        fi
    fi
fi

echo "Formatting FAT partition on ${DEV}"
sudo mkfs.vfat -F 32 ${DEV} -n BOOT

echo "Mounting ${DEV}"
sudo mount ${DEV} /media/card

if [ "$?" -ne 0 ]; then
    echo "Error mounting ${DEV} at /media/card"
    exit 1
fi

echo "Copying bootloader files"
sudo cp ${SRCDIR}/bootfiles/* /media/card

if [ $? -ne 0 ]; then
    echo "Error copying bootloader files"
    sudo umount ${DEV}
    exit 1
fi

echo "Creating overlay directory"
sudo mkdir /media/card/overlays

if [ $? -ne 0 ]; then
    echo "Error creating overlays directory"
    sudo umount ${DEV}
    exit 1
fi

echo 'Copying overlay dtbos'
for f in $( ls ${SRCDIR}/*.dtbo | grep -v -e "-${MACHINE}" )
do
    if [ -L ${f} ]; then
        sudo cp ${f} /media/card/overlays

        if [ $? -ne 0 ]; then
            echo "Error copying overlay: ${f}"
            sudo umount ${DEV}
            exit 1
        fi
    fi
done

echo "Copying dtbs"
for f in ${DTBS}; do
    if [ -f ${SRCDIR}/${f} ]; then
        sudo cp ${SRCDIR}/${f} /media/card

        if [ $? -ne 0 ]; then
            echo "Error copying dtb: ${f}"
            sudo umount ${DEV}
            exit 1
        fi
    fi
done

echo "Copying kernel"
sudo cp ${SRCDIR}/${KERNEL_IMAGETYPE} /media/card/${KERNEL_IMAGETYPE}

if [ $? -ne 0 ]; then
    echo "Error copying kernel"
    sudo umount ${DEV}
    exit 1
fi

if [ -f ${SRCDIR}/u-boot.bin ]; then
    echo "Copying u-boot.bin to card"
    sudo cp ${SRCDIR}/u-boot.bin /media/card

    if [ $? -ne 0 ]; then
        echo "Error copying u-boot"
        sudo umount ${DEV}
        exit 1
    fi

    if [ -f ${SRCDIR}/boot.scr ]; then
        echo "Copying boot.scr to card"
        sudo cp ${SRCDIR}/boot.scr /media/card

        if [ $? -ne 0 ]; then
            echo "Error copying boot.scr"
            sudo umount ${DEV}
            exit 1
        fi
    else
        echo "WARNING: No boot script found!"
    fi
fi

if [ -f ./config.txt ]; then
    echo "Copying local config.txt to card"
    sudo cp ./config.txt /media/card

    if [ $? -ne 0 ]; then
        echo "Error copying local config.txt to card"
        sudo umount ${DEV}
        exit 1
    fi
fi

if [ -f ./cmdline.txt ]; then
    echo "Copying local cmdline.txt to card"
    sudo cp ./cmdline.txt /media/card

    if [ $? -ne 0 ]; then
        echo "Error copying local cmdline.txt to card"
        sudo umount ${DEV}
        exit 1
    fi
fi

echo "Unmounting ${DEV}"
sudo umount ${DEV}

echo "Done"
