RPIFW_DATE = "20170615"
SRCREV = "0ab90562abdb50bf6456b426162a20b11da3b190"
SRC_URI[md5sum] = "ac3a2cef4e20ff812bd0fa1d60561e88"
SRC_URI[sha256sum] = "5c87bd686e142ac9193583ff38640b64cececa7d53f203270df9136a7a202477"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r62"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
