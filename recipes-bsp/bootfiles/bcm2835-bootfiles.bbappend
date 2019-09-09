RPIFW_DATE = "20190904"
SRCREV = "e2e17cd035fb8cd1a0b74d35d6615d7e267e408b"
SRC_URI[md5sum] = "aa5543faa7fba85ab845c5d64c59fd68"
SRC_URI[sha256sum] = "1aaabdac08ad3f6fd0aed744930de1471f5f92ead096c8a6156dc3637a07d1f0"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
