FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

LIC_FILES_CHKSUM = "file://LICENCE;md5=0448d6488ef8cc380632b1569ee6d196"

PR = "r11"

SRCREV = "cfd971c6300b4f2c1929fdd95a09d9bb03b87dbe"

SRC_URI = "\
    git://github.com/${SRCFORK}/userland.git;protocol=git;branch=${SRCBRANCH} \
    file://0001-fix-gcc-5.x-inlines.patch \
    file://0002-set-VMCS_INSTALL_PREFIX-to-usr.patch \
    file://0003-cmake-generate-and-install-pkgconfig-files.patch \
    "
