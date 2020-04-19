SUMMARY = "A QML test app"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtdeclarative qtquickcontrols2"

SRCREV = "8c5c1251cf92780f3bbd13f6bc5197eba0827bf1"
SRC_URI = "git://github.com/scottellis/${BPN}.git"

S = "${WORKDIR}/git"

require recipes-qt/qt5/qt5.inc

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/${PN} ${D}${bindir}
}

FILES_${PN} = "${bindir}"

RDEPENDS_${PN} = "qtdeclarative-qmlplugins"
