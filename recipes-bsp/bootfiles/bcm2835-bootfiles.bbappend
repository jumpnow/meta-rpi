RPIFW_DATE = "20190514"
SRCREV = "69a759d39aa802f65d0cc578361ff73e9dcbedc4"
SRC_URI[md5sum] = "07f59e415696bf600609160230f835b4"
SRC_URI[sha256sum] = "864319dd85ab59f98dc4ad2b67af8db21efb21226513347a3ba5ee32bddf028c"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
