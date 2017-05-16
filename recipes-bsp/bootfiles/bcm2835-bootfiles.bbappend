RPIFW_DATE = "20170515"
SRCREV = "73f44c607b48b6c7af89aa3cc034fa3d93d98379"
SRC_URI[md5sum] = "a63a94ea269b7f68052a652b7f8c799a"
SRC_URI[sha256sum] = "ef7905c480d610fb2db3c6b5063e0c9edd54f07c0c5f15f3c5d1d68de570a13b"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r57"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
