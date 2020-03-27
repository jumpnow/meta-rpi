RPIFW_DATE = "20200326"
SRCREV = "5574077183389cd4c65077ba18b59144ed6ccd6d"
SRC_URI[md5sum] = "1091837b8daed93b01dcc8980d936b40"
SRC_URI[sha256sum] = "0596505f529677906fed30e6c3c1d2387a5d287f668a719484e2f9d8a3059176"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
