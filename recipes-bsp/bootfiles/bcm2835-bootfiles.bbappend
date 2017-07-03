RPIFW_DATE = "20170630"
SRCREV = "715f2d95313da64b26713377eefe6c8c527b95c3"
SRC_URI[md5sum] = "6df65339c70c80a697eaf9a72208874a"
SRC_URI[sha256sum] = "92516d923a4a296e5130c22fc6c4401982aa90bad8e50f026e539114f972b51f"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r64"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
