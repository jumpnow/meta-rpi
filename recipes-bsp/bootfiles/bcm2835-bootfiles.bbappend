RPIFW_DATE = "20200520"
SRCREV = "6e1917336f618261c9d7f755294fac0a3f7c2c98"
SRC_URI[md5sum] = "933082efde6778dfbb94601b854e6898"
SRC_URI[sha256sum] = "ad8c3cef35e0b171265e0640d94ac8da6b048f0e301bbe1d042766f2a178c175"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
