RPIFW_DATE = "20180808"
SRCREV = "858697f3ae7dcc6c38ec4a7b5a9abb864d7c8101"
SRC_URI[md5sum] = "4a4bd9aea8a050d9667356bb256a41b2"
SRC_URI[sha256sum] = "f3b233a8560bbbb1a59113994d5a1ac7aad4ad8a7e7834ee48fa9e20835baadf"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
