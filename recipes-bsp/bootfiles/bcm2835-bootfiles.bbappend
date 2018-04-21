RPIFW_DATE = "20180416"
SRCREV = "a154f2136850dba827cf4bc40794854376902cbd"
SRC_URI[md5sum] = "bef2bd71209f067d03e747cb7e2a3332"
SRC_URI[sha256sum] = "bf26b061c68f98baa96d7457dd35667ab1908fa25bb20b606486e3fb195ae574"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
