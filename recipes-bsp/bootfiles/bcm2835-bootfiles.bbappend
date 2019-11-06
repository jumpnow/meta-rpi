RPIFW_DATE = "20191101"
SRCREV = "b79618b5db4e4e7c02f9ad9d3ada51713825313e"
SRC_URI[md5sum] = "d642832ee96f82ec543c9b6f200b453c"
SRC_URI[sha256sum] = "d7443e60d678fe8032683e91a348bdfbb7b8b8e251d73bbdf9fa86e7171dff1e"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
