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

BOOTLDRFILES="bootcode.bin \
              cmdline.txt \
              config.txt \
              fixup_cd.dat \
              fixup_db.dat \
              fixup_x.dat \
              start_cd.elf \
              start_db.elf \
              start.elf \
              start_x.elf"

OVERLAYDTBS="ads7846-overlay.dtb \
    at86rf233-overlay.dtb \
    bmp085_i2c-sensor-overlay.dtb \
    dht11-overlay.dtb \
    enc28j60-overlay.dtb \
    gpio-ir-overlay.dtb \
    gpio-poweroff-overlay.dtb \
    hifiberry-amp-overlay.dtb \
    hifiberry-dac-overlay.dtb \
    hifiberry-dacplus-overlay.dtb \
    hifiberry-digi-overlay.dtb \
    hy28a-overlay.dtb \
    hy28b-overlay.dtb \
    i2c-gpio-overlay.dtb \
    i2c-rtc-overlay.dtb \
    i2s-mmap-overlay.dtb \
    iqaudio-dac-overlay.dtb \
    iqaudio-dacplus-overlay.dtb \
    lirc-rpi-overlay.dtb \
    mcp2515-can0-overlay.dtb \
    mcp2515-can1-overlay.dtb \
    mmc-overlay.dtb \
    mz61581-overlay.dtb \
    pi3-disable-bt-overlay.dtb \
    piscreen2r-overlay.dtb \
    piscreen-overlay.dtb \
    pitft28-capacitive-overlay.dtb \
    pitft28-resistive-overlay.dtb \
    pps-gpio-overlay.dtb \
    pwm-overlay.dtb \
    pwm-2chan-overlay.dtb \
    qca7000-overlay.dtb \
    raspidac3-overlay.dtb \
    rpi-backlight-overlay.dtb \
    rpi-dac-overlay.dtb \
    rpi-display-overlay.dtb \
    rpi-ft5406-overlay.dtb \
    rpi-proto-overlay.dtb \
    rpi-sense-overlay.dtb \
    sdhost-overlay.dtb \
    sdio-1bit-overlay.dtb \
    sdio-overlay.dtb \
    smi-dev-overlay.dtb \
    smi-nand-overlay.dtb \
    smi-overlay.dtb \
    spi-bcm2708-overlay.dtb \
    spi-bcm2835-overlay.dtb \
    spi-dma-overlay.dtb \
    tinylcd35-overlay.dtb \
    uart1-overlay.dtb \
    vc4-kms-v3d-overlay.dtb \
    vga666-overlay.dtb \
    w1-gpio-overlay.dtb \
    w1-gpio-pullup-overlay.dtb"


DTBS="bcm2708-rpi-b.dtb \
      bcm2708-rpi-b-plus.dtb \
      bcm2709-rpi-2-b.dtb \
      bcm2710-rpi-3-b.dtb"

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

for f in ${OVERLAYDTBS}; do
	if [ ! -f ${SRCDIR}/Image-${f} ]; then
		echo "Overlay dtb not found: ${SRCDIR}/Image-${f}"
		exit 1
	fi
done

for f in ${DTBS}; do
	if [ ! -f ${SRCDIR}/Image-${f} ]; then
		echo "dtb not found: ${SRCDIR}/Image-${f}"
		exit 1
	fi
done
	
if [ ! -f ${SRCDIR}/Image ]; then
	echo "Kernel file not found: ${SRCDIR}/Image"
	exit 1
fi

DEV=/dev/${1}1

if [ ! -b ${DEV} ]; then
	echo -e "\nBlock device not found: ${DEV}\n"
	exit 1
fi

echo "Formatting FAT partition on ${DEV}"
sudo mkfs.vfat -F 32 ${DEV} -n BOOT

echo "Mounting ${DEV}"
sudo mount ${DEV} /media/card

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

echo "Copying overlay dtbs"
for f in ${OVERLAYDTBS}; do
	sudo cp ${SRCDIR}/Image-${f} /media/card/overlays/${f}

	if [ $? -ne 0 ]; then
		echo "Error copying overlay: $f"
		sudo umount ${DEV}
		exit 1
	fi
done

echo "Copying dtbs"
for f in ${DTBS}; do
	sudo cp ${SRCDIR}/Image-${f} /media/card/${f}

	if [ $? -ne 0 ]; then
		echo "Error copying dtb: $f"
		sudo umount ${DEV}
		exit 1
	fi
done

echo "Copying kernel"
if [ "${MACHINE}" = "raspberrypi2" ]; then 
	sudo cp ${SRCDIR}/Image /media/card/kernel7.img
else
	sudo cp ${SRCDIR}/Image /media/card/kernel.img
fi

if [ $? -ne 0 ]; then
	echo "Error copying kernel"
	sudo umount ${DEV}
	exit 1
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
  
echo "Unmounting ${DEV}"
sudo umount ${DEV}

echo "Done"

