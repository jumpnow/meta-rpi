SUMMARY = "Add firewall to init scripts"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += "file://init \
            file://firewall.rules"

PR = "r0"

S = "${WORKDIR}"

inherit update-rc.d
INITSCRIPT_NAME = "firewall"
INITSCRIPT_PARAMS = "start 60 S ."

do_install() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 init ${D}${sysconfdir}/init.d/firewall
    install -m 0744 firewall.rules ${D}${sysconfdir}
}

FILES_${PN} = "${sysconfdir}"

RDEPENDS_${PN} = "iptables"
