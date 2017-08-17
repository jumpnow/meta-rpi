RPIFW_DATE = "20170816"
SRCREV = "b9a8e6a5c540812490f678828e28197dca1e5a72"
SRC_URI[md5sum] = "69e12acf06b8b80ef384d4adce4a1e2b"
SRC_URI[sha256sum] = "76f64c2f7c56ee1fa2b80e86d8eb355e7c42bb21b5e9b547443fe9de11dc7abc"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r72"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
