SUMMARY = "A console development image customized for the rpi"
HOMEPAGE = "http://www.jumpnowtek.com"

require images/basic-dev-image.bb

DEPENDS += "bootfiles"

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
    vault \
"

RPI_STUFF = " \
    userland \
"

SYSTEMD_STUFF = " \
    systemd-analyze \
    systemd-bash-completion \
"

IMAGE_INSTALL += " \
    firewall \
    vim \
    ${DEV_EXTRAS} \
    ${RPI_STUFF} \
    ${SYSTEMD_STUFF} \
    ${WIFI} \
"


export IMAGE_BASENAME = "console-image"
