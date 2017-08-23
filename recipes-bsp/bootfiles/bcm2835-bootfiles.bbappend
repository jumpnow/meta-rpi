RPIFW_DATE = "20170822"
SRCREV = "8fe001ec3433b25657efc22691eac9c44174c0c5"
SRC_URI[md5sum] = "99bf100eacfd71713cc0410af8a21462"
SRC_URI[sha256sum] = "5c54c9d19ebeda31be474eb608c026beeb263164cff457163c87084f1d4b6c83"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r73"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
