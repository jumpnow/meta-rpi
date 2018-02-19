#!/bin/bash

KERNEL_IMAGETYPE=zImage

if [ -z "${MACHINE}" ]; then
    echo "Environment variable MACHINE not set"
    echo "Example: export MACHINE=raspberrypi3 or export MACHINE=raspberrypi0-wifi"
    exit 1
fi

case "${MACHINE}" in
    raspberrypi|raspberrypi0|raspberrypi0-wifi|raspberrypi-cm)
        DTBS="bcm2708-rpi-0-w.dtb \
              bcm2708-rpi-b.dtb \
              bcm2708-rpi-b-plus.dtb \
              bcm2708-rpi-cm.dtb"
        ;;
    raspberrypi2|raspberrypi3|raspberrypi-cm3)
        DTBS="bcm2709-rpi-2-b.dtb \
              bcm2710-rpi-3-b.dtb \
              bcm2710-rpi-cm3.dtb"
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
              fixup_db.dat \
              fixup_x.dat \
              start_cd.elf \
              start_db.elf \
              start.elf \
              start_x.elf"

if [ "x${1}" = "x" ]; then
    echo -e "\nUsage: ${0} <block device>\n"
    exit 0
fi

if [ ! -d /media/card ]; then
    echo "Temporary mount point [/media/card] not found"
    exit 1
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

for f in ${BOOTLDRFILES}; do
    if [ ! -f ${SRCDIR}/bcm2835-bootfiles/${f} ]; then
        echo "Bootloader file not found: ${SRCDIR}/bcm2835-bootfiles/$f"
        exit 1
    fi
done

have_one_dtb=0
for f in ${DTBS}; do
    if [ -f ${SRCDIR}/${KERNEL_IMAGETYPE}-${f} ]; then
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
sudo cp ${SRCDIR}/bcm2835-bootfiles/* /media/card

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

echo "Copying overlay dtbos"
for f in ${SRCDIR}/${KERNEL_IMAGETYPE}-*.dtbo; do
    if [ -L $f ]; then
        sudo cp $f /media/card/overlays
    fi
done

if [ $? -ne 0 ]; then
    echo "Error copying overlays"
    sudo umount ${DEV}
    exit 1
fi

echo "Stripping ${KERNEL_IMAGETYPE}- from overlay dtbos"
case "${KERNEL_IMAGETYPE}" in
    Image)
        sudo rename 's/Image-([\w\-]+).dtbo/$1.dtbo/' /media/card/overlays/*.dtbo
        ;;
    zImage)
        sudo rename 's/zImage-([\w\-]+).dtbo/$1.dtbo/' /media/card/overlays/*.dtbo
        ;;
    uImage)
        sudo rename 's/uImage-([\w\-]+).dtbo/$1.dtbo/' /media/card/overlays/*.dtbo
        ;;
esac

if [ $? -ne 0 ]; then
    echo "Error stripping overlays"
    sudo umount ${DEV}
    exit 1
fi

echo "Copying dtbs"
for f in ${DTBS}; do
    if [ -f ${SRCDIR}/${KERNEL_IMAGETYPE}-${f} ]; then
        sudo cp ${SRCDIR}/${KERNEL_IMAGETYPE}-${f} /media/card/${f}

        if [ $? -ne 0 ]; then
            echo "Error copying dtb: $f"
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

