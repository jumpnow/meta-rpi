EXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

LINUX_VERSION = "4.14.6"

SRCREV = "c98c67311c55d5363fd4942edf2ce4a325295710"
SRC_URI = "git://github.com/raspberrypi/linux.git;branch=rpi-4.14.y"

require linux-raspberrypi.inc
