RPIFW_DATE = "20180111"
SRCREV = "e5f6f31280e41cdc3ab50448549e0a49a457180d"
SRC_URI[md5sum] = "1d7235aaf50a54a22e34e858325c73d2"
SRC_URI[sha256sum] = "2e9574efa29f7f709405d865118e658de2a493c7f7c04e74b681ba1ce32105f0"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
