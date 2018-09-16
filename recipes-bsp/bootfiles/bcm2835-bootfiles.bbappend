RPIFW_DATE = "20180915"
SRCREV = "92e1937067e63285fac9b6d7863a6b5aac0c195e"
SRC_URI[md5sum] = "86bd9479d76e824154995d15253d0f11"
SRC_URI[sha256sum] = "4b082e034a28b4753c13595445da046e5a4f0a8b8022d94ad791fb87b44152d6"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
