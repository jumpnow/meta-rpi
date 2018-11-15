RPIFW_DATE = "20181112"
SRCREV = "86e3ccc14e43618f82a13e639002199de29a16b1"
SRC_URI[md5sum] = "7bfd9045cb99fab8728c2b2920c35179"
SRC_URI[sha256sum] = "5b3fcadb0a9c898ec79832d253899dce4fe6d86f393ff298a8d9764d332bf6cf"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
