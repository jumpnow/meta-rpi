RPIFW_DATE = "20200115"
SRCREV = "d5b8d8d7cce3f3eecb24c20a55cc50a48e3d5f4e"
SRC_URI[md5sum] = "f5c86891c3343120e0e88acd3458301c"
SRC_URI[sha256sum] = "93f9a7c87eb797f376ec9e59241c94bb5a45e47dcfa218c08087e68f21481a44"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
