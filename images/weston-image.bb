SUMMARY = "A basic weston/gtk3 test image"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

require console-image.bb

FONTS = " \
    fontconfig \
    fontconfig-utils \
    ttf-bitstream-vera \
"

GTK_STUFF = " \
    gtk+3 \
    gtkmm3 \
"

TSLIB = " \
    tslib-conf \
    tslib-calibrate \
    tslib \
"

WESTON_STUFF = " \
    weston \
    weston-init \
"

IMAGE_INSTALL += " \
    ${FONTS} \
    ${GTK_STUFF} \
    ${TSLIB} \
    ${WESTON_STUFF} \
"

export IMAGE_BASENAME = "weston-image"
