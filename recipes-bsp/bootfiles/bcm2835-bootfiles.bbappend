RPIFW_DATE = "20180209"
SRCREV = "445b6a86faec72eaddb8c4386b87e385e1c338ac"
SRC_URI[md5sum] = "d91b51ba8a381f967478e98dbf4c1a9c"
SRC_URI[sha256sum] = "879b87273e51f8ee7b6133d9dfaeee15776cf451fe4b52f8d609278cafcc9c56"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
