SUMMARY = "Disable X11 screensaver and blanking"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://disable-blanking.sh"

S = "${WORKDIR}"

FILES_${PN} =   "${bindir}/* ${sysconfdir}"

do_install_append () {
        install -d ${D}/${sysconfdir}/X11/Xsession.d
        install -m 755 disable-blanking.sh ${D}/${sysconfdir}/X11/Xsession.d/88disable-blanking.sh
}

FILES_${PN} =   "${sysconfdir}"
