RPIFW_DATE = "20181015"
SRCREV = "10c1c5f9637849e8a3a70e114d3837e25987fc7c"
SRC_URI[md5sum] = "1d59600401cc2ac1cfc3a44428f09677"
SRC_URI[sha256sum] = "ef95caef64a48feec0a909d256f214322f91f2af60de61c83acbb68298417b22"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
