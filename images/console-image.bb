SUMMARY = "A console development image customized for the rpi"
HOMEPAGE = "http://www.jumpnowtek.com"

require images/basic-dev-image.bb

DEPENDS += "bcm2835-bootfiles"

WIFI = " \
    crda \
    iw \
    linux-firmware-rpidistro-bcm43430 \
    linux-firmware-rpidistro-bcm43455 \
    wpa-supplicant \
"

DEV_EXTRAS = " \
    serialecho  \
    spiloop \
"

RPI_STUFF = " \
    omxplayer \
    raspi2fb \
    userland \
"

IMAGE_INSTALL += " \
    firewall \
    ${DEV_EXTRAS} \
    ${RPI_STUFF} \
    ${WIFI} \
    ${SECURITY_TOOLS} \
    ${WIREGUARD} \
"


export IMAGE_BASENAME = "console-image"
