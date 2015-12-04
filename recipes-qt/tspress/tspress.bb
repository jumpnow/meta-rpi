SUMMARY = "Qt5 test app"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

DEPENDS += "qtbase"

PR = "r2"

SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/scottellis/tspress.git"

S = "${WORKDIR}/git"

require recipes-qt/qt5/qt5.inc

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/tspress ${D}${bindir}
}

FILES_${PN} = "${bindir}"

RDEPENDS_${PN} = "qtbase-plugins"

