SUMMARY = "Add environment variable to show user@host in remote titlebar"

LICENSE = "GPL-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "file://term-prompt.sh"

PR = "0"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${sysconfdir}/profile.d
    install -m 0755 term-prompt.sh ${D}${sysconfdir}/profile.d
}

FILES_${PN} = "${sysconfdir}"

