SUMMARY = "PyQt5 touchscreen test app"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRCREV = "152b8da9f88a674f4e2dcbd9e8b38c4c497241d9"
SRC_URI = "git://github.com/scottellis/pytouch.git"

S = "${WORKDIR}/git"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/pytouch.py ${D}${bindir}
}

FILES_${PN} = "${bindir}"

RDEPENDS_${PN} = "python-pyqt5"
