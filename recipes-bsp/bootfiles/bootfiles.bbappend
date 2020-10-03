RPIFW_DATE = "20201002"
SRCREV = "11e3c314bc2b64f7d862bac00ff3d9f42f3c5a50"
SRC_URI[md5sum] = "b8d55f55daed10768086ecbe3a8cdef8"
SRC_URI[sha256sum] = "b8c9f5a3e987f418f11526cbf59f6a6c8103e8f5e94bccffb9ef3fd7ae834f98"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
