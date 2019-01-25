RPIFW_DATE = "20190122"
SRCREV = "81cca1a9380c828299e884dba5efd0d4acb39e8d"
SRC_URI[md5sum] = "e5f04cc8700888458f472862c4d702da"
SRC_URI[sha256sum] = "f1d631920ed4ae15f368ba7b8b3caa4ed604f5223372cc6debbd39a101eb8d74"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
