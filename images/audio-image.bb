SUMMARY = "A minimal console image that runs pianobar"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

IMAGE_LINGUAS = "en-us"

inherit core-image

DEPENDS += "bcm2835-bootfiles"

CORE_OS = " \
    ntp \
    ntp-tickadj \
    openssh openssh-keygen openssh-sftp-server \
    term-prompt \
    tzdata \
"

ALSA += " \
    alsa-dev \
    alsa-lib \
    alsa-utils \
    alsa-utils-scripts \
 "

IMAGE_INSTALL += " \
    ${ALSA} \
    ${CORE_OS} \
    iqaudio-mute \
    pianobar \
 "

set_local_timezone() {
    ln -sf /usr/share/zoneinfo/EST5EDT ${IMAGE_ROOTFS}/etc/localtime
}

disable_bootlogd() {
    echo BOOTLOGD_ENABLE=no > ${IMAGE_ROOTFS}/etc/default/bootlogd
}

ROOTFS_POSTPROCESS_COMMAND += " \
    set_local_timezone ; \
    disable_bootlogd ; \
 "

export IMAGE_BASENAME = "audio-image"
