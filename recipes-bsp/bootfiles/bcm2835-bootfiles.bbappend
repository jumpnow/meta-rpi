RPIFW_DATE = "20200416"
SRCREV = "11a76e07ef1b6304a378c4ee3da200fe6facea46"
SRC_URI[md5sum] = "cc5d1a4d285b88a0105df6619a6d3e84"
SRC_URI[sha256sum] = "faac2f457c5e76432b96f6aa142063e8c7cb4c173df2af6ce4710a7700e24836"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
