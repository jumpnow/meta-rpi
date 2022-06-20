RPIFW_DATE = "20220616"
SRCREV = "329af8a59d91ea023ce3e2566e2ccd4ec0624438"
SRC_URI[md5sum] = "5ad23fa29b0c052eb2aaa0c29c2ca33d"
SRC_URI[sha256sum] = "ebdb4991f902b4385c2aa250539855e04d62b483a3b0e3f29ab1c9f42b4a9d74"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
