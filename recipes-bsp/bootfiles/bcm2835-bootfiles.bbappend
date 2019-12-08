RPIFW_DATE = "20191205"
SRCREV = "9d6be5b07e81bdfb9c4b9a560e90fbc7477fdc6e"
SRC_URI[md5sum] = "645e812765c8b4ca05d6cb47a1f67ab0"
SRC_URI[sha256sum] = "484d52caed909fcafbf593cc3e726ea44a9218db7f0aeec843b825797eb9b0fc"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
