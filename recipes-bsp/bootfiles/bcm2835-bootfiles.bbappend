RPIFW_DATE = "20180710"
SRCREV = "d3c3d0318d0f0a5c1348739d46ecde329edad281"
SRC_URI[md5sum] = "f31d9ba5b1c50c1fda515ffc706993ce"
SRC_URI[sha256sum] = "4ff40ba5b08088f3ce1eae71f1fb55c58952517f2c7d2df72ccbfacff074b1c8"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
