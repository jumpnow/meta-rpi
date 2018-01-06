RPIFW_DATE = "20171231"
SRCREV = "f2914141114a90589d811a3f97d01fd5417d3ef3"
SRC_URI[md5sum] = "ebf9035fdf298feb99dcd1856430ffbc"
SRC_URI[sha256sum] = "065745a496f541ed93bdec68df1de86141ce8fef30eff4de63b7e73e4edcd929"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
