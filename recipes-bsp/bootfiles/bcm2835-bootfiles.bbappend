RPIFW_DATE = "20200110"
SRCREV = "62a0d75b67484cb306a2a6f8fa954d9644868169"
SRC_URI[md5sum] = "5d785f64f7fecefbf1cb912b37712055"
SRC_URI[sha256sum] = "088d094618924a90f65bb511808bbeb921e0769c878fa7baa9626954206f61a2"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
