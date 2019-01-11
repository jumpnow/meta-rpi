RPIFW_DATE = "20190109"
SRCREV = "9baae7655f01ac37ba3b28c0053e9c6d0085dcfb"
SRC_URI[md5sum] = "a45e2a7ac0de634ea3db48ece3fecda3"
SRC_URI[sha256sum] = "8aedd4cb14b0e4dd657677576d432d95615902b3976924661e0758678679d819"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
