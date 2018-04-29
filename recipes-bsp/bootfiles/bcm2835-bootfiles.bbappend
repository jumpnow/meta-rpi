RPIFW_DATE = "20180426"
SRCREV = "983b091aa491dc6b47e5cc62abb281dbcb75088d"
SRC_URI[md5sum] = "9e78663155b75a7413f9a82d9eac5ab5"
SRC_URI[sha256sum] = "a8a89daf5cc7f1ce342c97dba92305f95026b1c6d5e57cc2f11488307d619592"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
