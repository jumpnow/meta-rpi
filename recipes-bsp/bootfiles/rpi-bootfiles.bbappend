RPIFW_DATE = "20221118"
SRCREV = "b8a7365c70c68a85a52200cd84b94ea7332bce94"
SRC_URI[md5sum] = "02b4922785702c0d85c7e9cdc611f4a8"
SRC_URI[sha256sum] = "83beb98b104c49139646dab5f51e0298f1aaaca3255a419230148721cb2d4ca0"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
