RPIFW_DATE = "20181001"
SRCREV = "e924d3e880c21dbc82ec1368b1a0ae4fd592e525"
SRC_URI[md5sum] = "5e1179bedd8fbad849057c065252e221"
SRC_URI[sha256sum] = "2ca132232e1cbedb3cef33f9f1e2ead6db377538bd316b1a44f78a714fd08370"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
