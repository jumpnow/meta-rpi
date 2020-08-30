#!/bin/bash

LINUX=/src/linux/linux-rpi

OVERLAYS_DIR=${LINUX}/arch/arm/boot/dts/overlays

if [ ! -d ${OVERLAYS_DIR} ]; then
    echo "overlays dir not found: ${OVERLAYS_DIR}"
    exit 1
fi

basename -a $(ls ${OVERLAYS_DIR}/*.dts | grep -v overlay_map | sed s:-overlay\.dts:\.dtbo:) | \
	awk '{ print "    overlays/"$1, "\\" }'

echo '"'
