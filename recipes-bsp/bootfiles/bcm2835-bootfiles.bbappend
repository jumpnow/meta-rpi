RPIFW_DATE = "20171212"
SRCREV = "bcd3b8ff86949659e9eec20fd46bf27a2fcb971a"
SRC_URI[md5sum] = "cd2fefd9f38da1663235d9be749c39ca"
SRC_URI[sha256sum] = "eb8d06cc183f3fb22596312437b35fd59c8181868687bb8703e1986eaf807f38"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r90"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
