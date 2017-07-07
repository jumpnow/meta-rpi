RPIFW_DATE = "20170706"
SRCREV = "446b264183fe7cab2bb47832a2e3d6bc3a226f7a"
SRC_URI[md5sum] = "c1eaa6ba7d970764481c60ffe106a568"
SRC_URI[sha256sum] = "104edf88cc79660d9611f3607337b5bcdc93eb4f3ae47aa699140fd07382e782"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r65"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
