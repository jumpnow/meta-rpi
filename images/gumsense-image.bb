SUMMARY = "A console dev image for the Gumstix Sensor board"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require iot-image.bb

IMAGE_INSTALL += " \
    busybox-hwclock \
"

export IMAGE_BASENAME = "gumsense-image"
