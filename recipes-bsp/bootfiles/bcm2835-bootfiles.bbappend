RPIFW_DATE = "20180322"
SRCREV = "36f991382326907419f64917624427e59fd8e4a0"
SRC_URI[md5sum] = "431e94cc5fe14143982326ac4da6480f"
SRC_URI[sha256sum] = "ea451834e20136d249661e0ed7d1fdfa309249d233a387f44dd6c3b746a454c6"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
