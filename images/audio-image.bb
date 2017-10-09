SUMMARY = "A minimal console image that runs pianobar"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

IMAGE_LINGUAS = "en-us"

inherit core-image

DEPENDS += "bcm2835-bootfiles"

CORE_OS = " \
    firewall \
    iptables \
    ntp \
    ntp-tickadj \
    openssh openssh-keygen openssh-sftp-server \
    procps \
    term-prompt \
    tzdata \
"

WIFI_SUPPORT = " \
    crda \
    iw \
    linux-firmware-bcm43430 \
    wireless-tools \
    wpa-supplicant \
"

ALSA += " \
    libasound \
    libavcodec \
    libavdevice \
    libavfilter \
    libavformat \
    libavutil \
    libpostproc \
    libswresample \
    libswscale \
    alsa-conf \
    alsa-utils \
    alsa-utils-scripts \
 "

IMAGE_INSTALL += " \
    ${ALSA} \
    ${CORE_OS} \
    ${WIFI_SUPPORT} \
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
