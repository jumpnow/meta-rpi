RPIFW_DATE = "20240104"
SRCREV = "75591ce67c5e60382004d44f1cac2a3254f6611f"
SRC_URI[sha256sum] = "4d341baf2d605a1031cb959de52dee89fda3a3fe5a3735223703174f00aeece7"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}

INSANE_SKIP:${PN} += "src-uri-bad"
