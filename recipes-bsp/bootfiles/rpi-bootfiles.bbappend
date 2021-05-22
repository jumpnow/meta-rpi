RPIFW_DATE = "20210513"
SRCREV = "6c3d7745680f10802a7a5ed201e5252a3520e696"
SRC_URI[md5sum] = "43d19b768b45f9156a9651cf9296bdd3"
SRC_URI[sha256sum] = "1228188fb19f915dbed5a4ac430107337ffd66b4f5b97801bd737a3257bb537c"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
