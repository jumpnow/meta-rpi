RPIFW_DATE = "20180117"
SRCREV = "050175d55c63de401111644dc0f884952ba63b8e"
SRC_URI[md5sum] = "ad643a326f5acee500c49a54fca7258a"
SRC_URI[sha256sum] = "9cac13c6f6aebb32ca2a1e7a65d146f3e6d61162fb74ea9547e695edc363e42b"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
