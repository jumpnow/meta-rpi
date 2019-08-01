RPIFW_DATE = "20190729"
SRCREV = "c1f562f0b2ceca39dc81ac63b8b116dcd22d0a85"
SRC_URI[md5sum] = "0d2cba1da989d5cb6b09fb0af7458664"
SRC_URI[sha256sum] = "c9a8af53cd619978ba7ec3db47a35aee8bb15a1f8ef4ab6beadf07fa013c88cd"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
