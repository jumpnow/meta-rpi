RPIFW_DATE = "20170530"
SRCREV = "0f315f88ac91f9be93544bfd757f8d55ca4cf099"
SRC_URI[md5sum] = "c8bf818d14ee260c6d318a8ab037b1b8"
SRC_URI[sha256sum] = "bfeb5471762bef90fb8accb135e9cf4bb08c4a7556df42f31987bd4184f52d10"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r61"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
