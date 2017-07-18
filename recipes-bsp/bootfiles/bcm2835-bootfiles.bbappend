RPIFW_DATE = "20170713"
SRCREV = "63fd4a88e70b1ea70783dd408c2df12db74605c9"
SRC_URI[md5sum] = "1b0746d51d86f9b42ef73194e15daa2b"
SRC_URI[sha256sum] = "853d6aefb6841052dd19a1f555711896fa1d8aa6a09e1526b7772ece2d9abd83"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r66"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
