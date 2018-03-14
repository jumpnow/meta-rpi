RPIFW_DATE = "20180313"
SRCREV = "3347884c7df574bbabeff6dca63caf686e629699"
SRC_URI[md5sum] = "5bc8bc15872da598bd71b225a58b098e"
SRC_URI[sha256sum] = "a1f0db0fa87879588a39625e1b196c01e81dcf19f5f254b219e5b57047c3513e"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
