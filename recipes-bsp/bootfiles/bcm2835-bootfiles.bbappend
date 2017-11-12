RPIFW_DATE = "20171110"
SRCREV = "008700b83121b922fa692bd3ee83a4c5cb5fcc2d"
SRC_URI[md5sum] = "42f855e6ded654a0df4f7d8f71883c04"
SRC_URI[sha256sum] = "72bb1f3e959c0be79a0d7e8afb9fe76e00aa9f2a346f8960df9d068d5c17c9fe"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r86"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
