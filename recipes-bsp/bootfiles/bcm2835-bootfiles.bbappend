RPIFW_DATE = "20200106"
SRCREV = "dc5622560a2589a417007156b75db71f52b60d80"
SRC_URI[md5sum] = "2c55d9a0d9b059cd960c48399c521825"
SRC_URI[sha256sum] = "b4f62adf4dc572b1a482169e9688edd2d6a68500ad0d37257faab70eba2bb275"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
