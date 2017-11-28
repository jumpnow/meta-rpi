RPIFW_DATE = "20171124"
SRCREV = "77dfb311529b90eb080ca14b6fa51db880f57aa2"
SRC_URI[md5sum] = "0ec1e428359dc2a1bdc3ca312209e869"
SRC_URI[sha256sum] = "df744dded9fe9076c27fa0f58a6bb4826184d5d3815315a9d2626be36fe1a3c7"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r87"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
