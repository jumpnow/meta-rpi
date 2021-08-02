RPIFW_DATE = "20210727"
SRCREV = "e83f41345103a7fec73ccc5a2970d1812de77cdf"
SRC_URI[md5sum] = "82572a4b77b69d2c8500de6bb0a8f3df"
SRC_URI[sha256sum] = "e7bd4532ac913663b5a8bf2644277208f3fc48e8136ddc84dad7ce1b62e4c37d"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
