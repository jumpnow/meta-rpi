SUMMARY = "Program to copy the Raspberry Pi display to a secondary framebuffer"
HOMEPAGE = "https://github.com/AndrewFromMelbourne/raspi2fb"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "libbsd userland"

SRCREV = "e4a07dc2f33b13e51bffcd92ebecaa24dd86dfad"
SRC_URI = "\
    git://github.com/AndrewFromMelbourne/raspi2fb \
    file://0001-Fix-cmake-paths-for-yocto-build.patch \
    file://0002-Fix-init-script-for-yocto.patch \
    file://default \
"

PR = "r3"

S = "${WORKDIR}/git"

inherit cmake

do_install_append () {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${S}/raspi2fb.init.d ${D}${sysconfdir}/init.d/raspi2fb

    install -d ${D}${sysconfdir}/default
    install -m 0664 ${WORKDIR}/default ${D}${sysconfdir}/default/raspi2fb
}

FILES_${PN} = "${bindir} ${sysconfdir}"
