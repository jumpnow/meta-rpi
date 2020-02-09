RPIFW_DATE = "20200207"
SRCREV = "154e61a689f294b2ca025641f3f768cc484cc0dc"
SRC_URI[md5sum] = "00f4aa48d8d2b05997b32fefe083ebb2"
SRC_URI[sha256sum] = "96d2866c85cd4e34850ff91ba95d63a85cd38d5d697ba1ba99c207b7cde053f9"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
