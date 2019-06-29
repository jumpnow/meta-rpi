RPIFW_DATE = "20190626"
SRCREV = "bcf40b5c2b94178c7564fb451098d44968e44af5"
SRC_URI[md5sum] = "79e07b867d6e5157f04896e53e558898"
SRC_URI[sha256sum] = "c82c40cf37fac36160a7f6b9c314506beb942bf113a55d30fa163c56a4f98946"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
