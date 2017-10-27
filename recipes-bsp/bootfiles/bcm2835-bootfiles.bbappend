RPIFW_DATE = "20171024"
SRCREV = "d5088b03a0185c6c9a60cf0dd0a18f0838c6b18d"
SRC_URI[md5sum] = "ffa93bbe6a2a98958d93f78e81773ae5"
SRC_URI[sha256sum] = "9fc25133197819f9b025dfa4f85c8f6f40eab515b0f5b244b7c0feb3d16d5ccf"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r84"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
