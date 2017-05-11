RPIFW_DATE = "20170509"
SRCREV = "f3b0e1f044081f6df8fa74fd523317e2efa402c3"
SRC_URI[md5sum] = "faa270585f06c92d9d7aba96e4faa415"
SRC_URI[sha256sum] = "61c1bf7ce28da401090752d81129ed07230124f4b4c94f1cef258855d869b462"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r56"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
