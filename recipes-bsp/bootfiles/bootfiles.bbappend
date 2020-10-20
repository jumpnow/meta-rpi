RPIFW_DATE = "20201019"
SRCREV = "358f4c271f2bc10931aae8fe0879ffaded8b9c44"
SRC_URI[md5sum] = "eb1ee9d442f2ed6f5da4a70991d4dd17"
SRC_URI[sha256sum] = "c7a8c2b8cfe1977095d62086d340d6c15a383562aba2742e21df7f5f792aeb4b"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
