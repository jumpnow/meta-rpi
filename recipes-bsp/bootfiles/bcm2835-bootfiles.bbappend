RPIFW_DATE = "20180926"
SRCREV = "e80b826911d016911b23b8fcc4578642acbed251"
SRC_URI[md5sum] = "e73c54314c2bc6fec1d0c91695a77a29"
SRC_URI[sha256sum] = "796c9e943905ec28f592fdc7c70b9ffa96a328561f54e10abd07f6921d85d350"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
