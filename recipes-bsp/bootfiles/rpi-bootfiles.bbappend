RPIFW_DATE = "20220202"
SRCREV = "6159b7c1195b41aa43b0d2f322e192d84845e622"
SRC_URI[md5sum] = "d5a0e8f148d3c5f2696632040093e69c"
SRC_URI[sha256sum] = "4bf70ae602b7d41347490f43d3f600ab2dc01019abb732859b2a37d7053d5c13"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
