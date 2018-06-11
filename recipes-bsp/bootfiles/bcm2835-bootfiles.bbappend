RPIFW_DATE = "20180603"
SRCREV = "78841788b5b1b0de25e7cd066ec0a9c177e7a086"
SRC_URI[md5sum] = "cf875cb8a9d0d2fc0bebc343ec3f38bc"
SRC_URI[sha256sum] = "49b88c0d719556c454a5dc4de504ccc36efa0c36cc93764e96fbcd2baab01385"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
