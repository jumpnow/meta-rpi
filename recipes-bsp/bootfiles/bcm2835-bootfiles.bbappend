RPIFW_DATE = "20181019"
SRCREV = "8993bff0b82f8cd8d60409d28bb61d2197606ebb"
SRC_URI[md5sum] = "fa8894cfbdcc8b62e8ab16ea78082018"
SRC_URI[sha256sum] = "f3ed3f72da29d1966d9d98b67ccac4ce5d6830ed0eaa9caea2564a30d0d966c3"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
