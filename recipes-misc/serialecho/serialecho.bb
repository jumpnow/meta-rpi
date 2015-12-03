SUMMARY = "Utility to test serial ports in a loopback configuration"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/scottellis/serialecho.git"

S = "${WORKDIR}/git"

do_install() {
    install -d ${D}${bindir}
    install -m 755 serialecho ${D}${bindir}
}

FILES_${PN} = "${bindir}"

