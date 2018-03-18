RPIFW_DATE = "20180316"
SRCREV = "25cf637ccc90d7d2fa37277c807ab33b655bd0f4"
SRC_URI[md5sum] = "ed5cd5a8e4db552e156786a1a3f57aeb"
SRC_URI[sha256sum] = "17763f507af3dbe5926917fcf601298e19944fc0816b20342457b9155c152c26"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
