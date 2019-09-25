RPIFW_DATE = "20190925"
SRCREV = "f5c626c64874d6e1482edf4a76aa22e5e54be63d"
SRC_URI[md5sum] = "6c526c01054c0e11eaba12f614a4389a"
SRC_URI[sha256sum] = "388dd784a4c9a9fcdbf777c54e9cb5fae70a0e7666a137153ac23f459ad113b6"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
