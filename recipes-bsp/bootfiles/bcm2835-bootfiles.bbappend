RPIFW_DATE = "20200130"
SRCREV = "63bdbe0ea609a69f5c0a2212d608ef3d9915a7ad"
SRC_URI[md5sum] = "3fd11c2cfd05a3eea20974aa4403b575"
SRC_URI[sha256sum] = "a2c77775c4912bdeee51a0bd7f23ba4a74a7ab9662ca32524247478990630c5a"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
