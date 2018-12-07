SUMMARY = "Utility to update entropy count after adding to urandom"
DESCRIPTION = "Writing to /dev/urandom does not increment entropy count"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e048e7a053ab211791bc99c98e723ab7"

SRCREV = "03e3e6aa1ea6b49a2adf1b481db4f1967c5e51f7"
SRC_URI = "git://github.com/jumpnow/rndaddtoentcnt.git"

S = "${WORKDIR}/git"

TARGET_CC_ARCH += "${LDFLAGS}"

do_install() {
    install -d ${D}${bindir}
    install -m 755 rndaddtoentcnt ${D}${bindir}
}

FILES_${PN} = "${bindir}"
