RPIFW_DATE = "20171006"
SRCREV = "2669578d1449255edf23f38ed98d208ab73faed7"
SRC_URI[md5sum] = "96ffa0e34dadbb7acaacc29cd6cb6f43"
SRC_URI[sha256sum] = "eddb1743145c6b18f967d24973cfe2e2ced14b51c5db3677f5e5389c232d7aee"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r80"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
