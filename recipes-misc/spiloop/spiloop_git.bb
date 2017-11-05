SUMMARY = "Utility to test spidev in a loopback configuration"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

SRCREV = "cc1deb3c947ddc04966805b7ebff45ada4f2535c"
SRC_URI = "git://github.com/scottellis/spiloop.git"

S = "${WORKDIR}/git"

TARGET_CC_ARCH += "${LDFLAGS}"

do_install() {
    install -d ${D}${bindir}
    install -m 755 spiloop ${D}${bindir}
}

FILES_${PN} = "${bindir}"
