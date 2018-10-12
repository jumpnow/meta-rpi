RPIFW_DATE = "20181009"
SRCREV = "fbad6408c4596d3d671736ee0571aae444f24e68"
SRC_URI[md5sum] = "702c7fef79a5480a4f259cc460d9fb62"
SRC_URI[sha256sum] = "57c56e9e41a2d9b1ce660aa7887db5c4b44f768fc63c6b6ef1d2fe460a090d85"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
