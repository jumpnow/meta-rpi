RPIFW_DATE = "20230524"
SRCREV = "8d6d842d3954f8de379b8ade3e26fec69d333d96"
SRC_URI[sha256sum] = "1c72da6b16e9ce200c8eab45830c246d999c08b7d54dbda23376653ac0fb12cc"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
