RPIFW_DATE = "20220909"
SRCREV = "915a7080ccfbf253053e249bde6489a5be908498"
SRC_URI[md5sum] = "b1d9dc56a61b9092820f0bc1a089512a"
SRC_URI[sha256sum] = "386cb658d20bb06c6f3f87b4a36acc7fa33568053597942820d12c9891abcb49"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
