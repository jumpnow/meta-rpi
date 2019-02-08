RPIFW_DATE = "20190205"
SRCREV = "ea3841a7f916895a98da5c5972cca68baff8aac3"
SRC_URI[md5sum] = "5cb3e1571b7282492ba0b359cad7ec48"
SRC_URI[sha256sum] = "5113a5113f5c3b7d589fce0494218a0648790431350b9b3b738c8437e21fcb95"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
