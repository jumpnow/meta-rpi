RPIFW_DATE = "20180905"
SRCREV = "0b6fd4f1e887ad3883e139abe2ee114a7a8f82d5"
SRC_URI[md5sum] = "8f4500f9f938d744c5db1055df29441c"
SRC_URI[sha256sum] = "d1cb5ba338c6fedc383add6b032eeb5a0cebf0aa8f234d5f31a55e06da5de2e7"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
