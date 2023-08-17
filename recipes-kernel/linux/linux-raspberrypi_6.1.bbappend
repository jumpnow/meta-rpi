FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "6.1.45"

SRCREV_machine = ""
SRCREV_kmeta = ""

SRCREV = "19a1b03529363945fbbb4b9160fe8645809a9dce"

SRC_URI = "\
    git://github.com/raspberrypi/linux.git;branch=${LINUX_RPI_BRANCH};protocol=https \
    file://ikconfig.cfg \
"

KERNEL_DEVICETREE = " \
    ${RPI_KERNEL_DEVICETREE} \
    ${RPI_KERNEL_DEVICETREE_OVERLAYS} \
"

RPI_KERNEL_DEVICETREE = " \
    bcm2708-rpi-zero-w.dtb \
    bcm2710-rpi-3-b-plus.dtb \
    bcm2710-rpi-3-b.dtb \
    bcm2710-rpi-cm3.dtb \
"

RPI_KERNEL_DEVICETREE_OVERLAYS = " \
    overlays/i2c0.dtbo \
    overlays/i2c1.dtbo \
    overlays/i2c3.dtbo \
    overlays/i2c4.dtbo \
    overlays/i2c5.dtbo \
    overlays/i2c6.dtbo \
    overlays/i2c-bcm2708.dtbo \
    overlays/i2c-gpio.dtbo \
    overlays/i2c-mux.dtbo \
    overlays/i2c-pwm-pca9685a.dtbo \
    overlays/i2s-dac.dtbo \
    overlays/iqaudio-codec.dtbo \
    overlays/iqaudio-dac.dtbo \
    overlays/iqaudio-dacplus.dtbo \
"
