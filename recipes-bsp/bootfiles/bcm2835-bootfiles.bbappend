RPIFW_DATE = "20191011"
SRCREV = "9f4983548584d4f70e6eec5270125de93a081483"
SRC_URI[md5sum] = "0ba5b71a5cdb9309105f8406be5ef2df"
SRC_URI[sha256sum] = "6e04cfca954c8e087eae81837a0813a642dcca58f05bcfdf6a15e69dc657a30e"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
