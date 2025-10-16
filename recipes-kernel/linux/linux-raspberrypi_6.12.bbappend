FILESEXTRAPATHS:prepend := "${THISDIR}/linux-raspberrypi-6.12:"

LINUX_RPI_BRANCH = "rpi-6.12.y"
LINUX_VERSION = "6.12.52"

SRCREV_machine = ""
SRCREV_kmeta = ""

unset KBUILD_DEFCONFIG

SRCREV = "f02b0965a951f2ae1f66718126480f1ca7f43693"

SRC_URI = "\
    git://github.com/raspberrypi/linux.git;branch=${LINUX_RPI_BRANCH};protocol=https \
    file://defconfig \
"

KERNEL_DEVICETREE = " \
    ${RPI_KERNEL_DEVICETREE} \
    ${RPI_KERNEL_DEVICETREE_OVERLAYS} \
"

RPI_KERNEL_DEVICETREE = " \
    broadcom/bcm2708-rpi-zero.dtb \
    broadcom/bcm2708-rpi-zero-w.dtb \
    broadcom/bcm2710-rpi-3-b.dtb \
    broadcom/bcm2710-rpi-3-b-plus.dtb \
"

# RPI_KERNEL_DEVICETREE_OVERLAYS = ""
