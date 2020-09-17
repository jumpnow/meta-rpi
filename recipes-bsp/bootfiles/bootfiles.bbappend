RPIFW_DATE = "20200916"
SRCREV = "28f031eb3a06b94ce9219973fad72e4a647bb690"
SRC_URI[md5sum] = "20749343a83dc3ba635b058fd5e05b23"
SRC_URI[sha256sum] = "427d0b47c1009dcad99491b265410ebf26c70339684c9892b8e14e747a29243c"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
