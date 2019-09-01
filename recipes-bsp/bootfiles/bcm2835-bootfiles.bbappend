RPIFW_DATE = "20190830"
SRCREV = "bc79c34e7f9224a19db85272f38035b3b17de4e5"
SRC_URI[md5sum] = "57d768ec15ffa5cee2dcd83d57c2b659"
SRC_URI[sha256sum] = "6d5a42229e196b151ff6d4abd5f7a3a93af5dc50efc97621e5078244b2b62420"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
