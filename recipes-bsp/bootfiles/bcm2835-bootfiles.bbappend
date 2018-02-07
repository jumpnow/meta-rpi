RPIFW_DATE = "20180205"
SRCREV = "4c9ff4884879c4114796eafb297a5c1ac04cba9a"
SRC_URI[md5sum] = "b58d52466bc8638bc0d89e293970c291"
SRC_URI[sha256sum] = "951fae275ce387cfd2d2d9334fdb68edee7951a849d68e3dd9fe2455fbaea156"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
