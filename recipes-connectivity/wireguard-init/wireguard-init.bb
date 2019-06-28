SUMMARY = "Wireguard sysvinit startup script"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://init"

S = "${WORKDIR}"

inherit update-rc.d
INITSCRIPT_NAME = "wireguard"
INITSCRIPT_PARAMS = "start 70 S ."

do_install() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 init ${D}${sysconfdir}/init.d/wireguard
}

FILES_${PN} = "${sysconfdir}"

RDEPENDS_${PN} = "wireguard-tools"
