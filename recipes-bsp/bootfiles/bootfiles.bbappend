RPIFW_DATE = "20200810"
SRCREV = "18aa72c5e05677b8a8af835bd60409e3253817aa"
SRC_URI[md5sum] = "285453979ec7730f9547445056d58e44"
SRC_URI[sha256sum] = "9e946f96aff5791150703ea3510f26724e80048ba7c2985e28fbba6a2e1406d2"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
