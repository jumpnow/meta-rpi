SUMMARY = "A minimal console image that runs pianobar"
HOMEPAGE = "http://www.jumpnowtek.com"

IMAGE_FEATURES += "package-management"
IMAGE_LINGUAS = "en-us"

require images/basic-image.bb

DEPENDS += "bootfiles"

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
    alsa-state \
    alsa-utils \
    alsa-utils-scripts \
"

IMAGE_INSTALL += " \
    ${ALSA} \
    iqaudio-enable \
    pianobar \
"

set_local_timezone() {
    ln -sf /usr/share/zoneinfo/EST5EDT ${IMAGE_ROOTFS}/etc/localtime
}

ROOTFS_POSTPROCESS_COMMAND += " \
    set_local_timezone ; \
"

export IMAGE_BASENAME = "audio-image"
