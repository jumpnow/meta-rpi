SUMMARY = "IQAudio Pi-DigiAMP+ gpio mute pin enable"
HOMEPAGE = "http://www.jumpnowtek.com/"
SECTION = "console"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://iqaudio-enable \
           file://iqaudio-enable.service \
          "

S = "${WORKDIR}"

inherit systemd

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE_${PN} = "${PN}.service"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${S}/${PN} ${D}${bindir}

	install -d ${D}${systemd_unitdir}/system
	install -m 0644 ${S}/${PN}.service ${D}${systemd_unitdir}/system
}

FILES_${PN} += "${bindir} ${systemd_unitdir}"
