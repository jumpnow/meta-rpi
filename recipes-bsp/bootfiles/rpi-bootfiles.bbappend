RPIFW_DATE = "20221005"
SRCREV = "53f4941b7bb2512e07fa7c6baec29cbee4889848"
SRC_URI[md5sum] = "39ed0ad2f5280280b53b60d9a20c4768"
SRC_URI[sha256sum] = "4596bbac8aaf622efc0b6db2d25c03430c7c9bcfd014655f064102a07f537b77"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
