RPIFW_DATE = "20180803"
SRCREV = "1b51c69e77c995a2da223948ab3844db177704af"
SRC_URI[md5sum] = "81a260f7e62cea6103e6b6d360053eba"
SRC_URI[sha256sum] = "e6f04b50fd928bfcf43438b5fdb097b82b256eb7ebd5bc6fc16f1ac8f6090b7b"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
