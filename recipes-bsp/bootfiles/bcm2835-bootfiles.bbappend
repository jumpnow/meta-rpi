RPIFW_DATE = "20180410"
SRCREV = "ae9a493932e47e08cabb25a2728037298075fd00"
SRC_URI[md5sum] = "5bdeda535df91fc882ff0ed9e08dffa8"
SRC_URI[sha256sum] = "b6ea6c4ae9ea6a5028ef7bb7e077a68ed2b26a6dd4fc10a60f86f18a7b08cf92"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
