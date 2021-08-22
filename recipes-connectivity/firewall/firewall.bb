SUMMARY = "Add firewall service"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += "file://firewall.service \
            file://firewall-test.service \
            file://firewall.sh"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_PACKAGES="${PN}"

do_install() {
    install -d ${D}${sbindir}
    install -m 0750 firewall.sh ${D}${sbindir}

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 firewall.service ${D}${systemd_system_unitdir}
    install -m 0644 firewall-test.service ${D}${systemd_system_unitdir}
}

FILES_${PN} = "${sbindir} ${systemd_system_unitdir}"

RDEPENDS_${PN} = "iptables"

SYSTEMD_SERVICE_${PN} = "firewall.service"
