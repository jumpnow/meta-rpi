RPIFW_DATE = "20170825"
SRCREV = "7f7df25d0f02eed1627e02a42d88c273c40bb5b0"
SRC_URI[md5sum] = "001d55e30de67af5dc3ca057c66882d0"
SRC_URI[sha256sum] = "ace6fe5dd2f6b01771bad6ae3d63787075f52caf5cf5b915f3a302a0e1bbe18a"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r74"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
