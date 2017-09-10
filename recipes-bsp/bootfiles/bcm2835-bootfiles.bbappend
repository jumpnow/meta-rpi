RPIFW_DATE = "20170908"
SRCREV = "77d8fdd23ceddfc23e16fa799912645507a7cd62"
SRC_URI[md5sum] = "1e065304d1f67ec7ce890e4db4c3fe5c"
SRC_URI[sha256sum] = "8f74ac02f007b95087832e41a3951fbe1b8469a2020877cae08966769b07d7d0"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r77"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
