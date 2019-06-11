SUMMARY = "IQAudio Pi-DigiAMP+ gpio mute pin enable"
HOMEPAGE = "http://www.jumpnowtek.com/"
SECTION = "console"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://init"

S = "${WORKDIR}"

inherit update-rc.d

INITSCRIPT_NAME = "iqaudio-mute-gpio"
INITSCRIPT_PARAMS = "start 30 5 ."

do_install() {
	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/init ${D}${sysconfdir}/init.d/iqaudio-mute-gpio
}

FILES_${PN} += "${sysconfdir}"
