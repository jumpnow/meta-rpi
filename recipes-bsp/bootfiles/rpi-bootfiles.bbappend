RPIFW_DATE = "20210716"
SRCREV = "4be1d21062e8b646e588e104a5a5d414996a48b2"
SRC_URI[md5sum] = "7d5cc6374d0c851a2226fc92cf070e83"
SRC_URI[sha256sum] = "7309e460166ae623cbef803b041767c9f8adc3f536800fc883280ba955706dc2"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
