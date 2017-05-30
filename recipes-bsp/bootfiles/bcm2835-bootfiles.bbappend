RPIFW_DATE = "20170526"
SRCREV = "32c28990b18908ce899c289bcd12c6e9daeb1588"
SRC_URI[md5sum] = "86feb248dd997575ea8ed226a3a4b6ef"
SRC_URI[sha256sum] = "3a5b531e11208ae9f0ce4e1f836d0f57e1959a8f1d04553d5876efe3739b15f7"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r59"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
