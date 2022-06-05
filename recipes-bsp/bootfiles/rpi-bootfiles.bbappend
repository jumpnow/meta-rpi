RPIFW_DATE = "20220601"
SRCREV = "58858ec28b78ed6ac9e243244fc4d2daa382ba5a"
SRC_URI[md5sum] = "7205a83b2fc17ee305b9f3aab045df57"
SRC_URI[sha256sum] = "9638b8ecc0ed21cde2686c436b0956d2ee3b0cfb19dd2195f039ec3054031340"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
