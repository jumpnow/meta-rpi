EXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

LINUX_VERSION = "4.14.7"

SRCREV = "f55e87913ab71b00924b72bbff359cc2e0faaa7d"
SRC_URI = "git://github.com/raspberrypi/linux.git;branch=rpi-4.14.y"

require linux-raspberrypi.inc
