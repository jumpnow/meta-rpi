#!/bin/bash

if [ -z "${DSTDIR}" ]; then
    DSTDIR=~/rpi/upload
fi

if [ ! -d ${DSTDIR} ]; then
    mkdir ${DSTDIR}

    if [ $? -ne 0 ]; then
        echo "Failed to create $DSTDIR"
        exit 1
    fi
fi

if [ -z "${IMG}" ]; then
    IMG=console
fi

if [ -z "${MACHINE}" ]; then
    if [ -f ../../build/conf/local.conf ]; then
        export MACHINE=$(grep '^MACHINE =' ../../build/conf/local.conf | cut -d'=' -f2 | tr -d '"' | tr -d ' ')
        echo "Using MACHINE from local.conf: $MACHINE"
    fi
fi

IMG_LONG="${IMG}-image-${MACHINE}"

if [ ! -d /media/card ]; then
        echo "Temporary mount point [/media/card] not found"
        exit 1
fi

if [ "x${1}" = "x" ]; then
    CARDSIZE=2
else
    if [ "${1}" -eq 2 ]; then
        CARDSIZE=2
    elif [ "${1}" -eq 4 ]; then
        CARDSIZE=4
    else
        echo "Unsupported card size: ${1}"
        exit 1
    fi
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

if [ -z "${OETMP}" ]; then
    echo "OETMP environment variable not set"
    exit 1
fi

if [ -z "${MACHINE}" ]; then
    echo "MACHINE environment variable not set"
    exit 1
fi

HOSTNAME=${MACHINE}

SRCDIR=${OETMP}/deploy/images/${MACHINE}

if [ ! -f "${SRCDIR}/${IMG_LONG}.tar.xz" ]; then
    echo "File not found: ${SRCDIR}/${IMG_LONG}.tar.xz"
    exit 1
fi

SDIMG=${IMG}-${MACHINE}-${CARDSIZE}gb.img

if [ -f "${DSTDIR}/${SDIMG}" ]; then
        rm ${DSTDIR}/${SDIMG}
fi

if [ -f "${DSTDIR}/${SDIMG}.xz" ]; then
        rm -f ${DSTDIR}/${SDIMG}.xz*
fi

echo -e "\n***** Creating the loop device *****"
LOOPDEV=`losetup -f`

echo -e "\n***** Creating an empty SD image file *****"
dd if=/dev/zero of=${DSTDIR}/${SDIMG} bs=1G count=${CARDSIZE}

echo -e "\n***** Partitioning the SD image file *****"
sudo fdisk ${DSTDIR}/${SDIMG} <<END
o
n
p
1

+64M
n
p
2


t
1
c
a
1
w
END

echo -e "\n***** Attaching to the loop device *****"
sudo losetup -P ${LOOPDEV} ${DSTDIR}/${SDIMG}

echo -e "\n***** Copying the boot partition *****"
DEV=${LOOPDEV}p1
./copy_boot.sh ${DEV}

if [ $? -ne 0 ]; then
    sudo losetup -D
    exit
fi

echo -e "\n***** Copying the rootfs *****"
DEV=${LOOPDEV}p2
./copy_rootfs.sh ${DEV} ${IMG} ${HOSTNAME}

if [ $? -ne 0 ]; then
    sudo losetup -D
    exit
fi

echo -e "\n***** Detatching loop device *****"
sudo losetup -D

echo -e "\n***** Compressing the SD card image *****"
sudo xz -9 ${DSTDIR}/${SDIMG}

echo -e "\n***** Creating an md5sum *****"
cd ${DSTDIR}
md5sum ${SDIMG}.xz > ${SDIMG}.xz.md5
cd ${OLDPWD}

echo -e "\n***** Done *****\n"
