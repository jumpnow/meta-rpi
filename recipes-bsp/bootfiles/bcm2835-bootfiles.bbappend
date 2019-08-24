RPIFW_DATE = "20190823"
SRCREV = "7163480fff007dc98978899b556dcf06f8a462c8"
SRC_URI[md5sum] = "b10044aa637ed170eef2ca6c1dcc8aba"
SRC_URI[sha256sum] = "012bc542157d03d19c52dfb2ff9e828905d1991a8b33420f1a2e3730040c167f"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
