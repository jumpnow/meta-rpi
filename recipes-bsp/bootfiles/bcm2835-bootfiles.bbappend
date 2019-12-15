RPIFW_DATE = "20191211"
SRCREV = "0c01dbefba45a08c47f8538d5a071a0fba6b7e83"
SRC_URI[md5sum] = "0d436db475f6a0b7d019156ecc2fe09f"
SRC_URI[sha256sum] = "6f5251c6cd1338947b49cdfa84bd581ef8c52cd9fd69a5fb7905995564a8de49"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
