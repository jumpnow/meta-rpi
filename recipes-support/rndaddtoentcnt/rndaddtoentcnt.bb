SUMMARY = "Utility to update entropy count after adding to urandom"
DESCRIPTION = "Writing to /dev/urandom does not increment entropy count"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://rndaddtoentcnt.c \
           file://Makefile \
          "

S = "${WORKDIR}"

TARGET_CC_ARCH += "${LDFLAGS}"

do_install() {
    install -d ${D}${bindir}
    install -m 755 rndaddtoentcnt ${D}${bindir} 
}

FILES_${PN} = "${bindir}"
