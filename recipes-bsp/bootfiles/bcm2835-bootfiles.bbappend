RPIFW_DATE = "20180917"
SRCREV = "3221a3d2a8f181fb0984b3f93287afe25573deb0"
SRC_URI[md5sum] = "fcc537a990a15b422bd3fa241c6bf497"
SRC_URI[sha256sum] = "54c5480ed538e2109ce5e47c03282561116b940621e9106d4a7610083e718683"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
