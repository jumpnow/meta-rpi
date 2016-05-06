SUMMARY = "A console image that runs pianobar"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require console-image.bb

ALSA += " \
    alsa-dev \
    alsa-lib \
    alsa-utils \
    alsa-utils-scripts \
 "

IMAGE_INSTALL += " \
    ${ALSA} \
    iqaudio-mute \
    pianobar \
 "

export IMAGE_BASENAME = "audio-image"
