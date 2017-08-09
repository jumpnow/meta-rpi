RPIFW_DATE = "20170808"
SRCREV = "e7ba7ab135f5a68b2c00a919ea9ac8d5528a5d5b"
SRC_URI[md5sum] = "d62a115ba2ff35b4a6a5b4b1b6f24baa"
SRC_URI[sha256sum] = "8ac878daa01562b17851940dc63ae7108ca823998568c0b4909a7ce133cc299b"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r71"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
