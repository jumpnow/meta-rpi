SUMMARY = "Save and restore alsamixer settings"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += "file://init"

S = "${WORKDIR}"

inherit update-rc.d

INITSCRIPT_NAME = "alsa-state"
INITSCRIPT_PARAMS = "start 35 5 stop 5 0 6 ."

do_install() {
        install -d ${D}${sysconfdir}/init.d
        install -m 0755 ${S}/init ${D}${sysconfdir}/init.d/alsa-state
}

FILES_${PN} += "${sysconfdir}"

