RPIFW_DATE = "20181105"
SRCREV = "55e591283f456ab9cebd9c31aaef4939f814880d"
SRC_URI[md5sum] = "4f1f96a1b1cb1ad7b947a8821260e938"
SRC_URI[sha256sum] = "a0595532ac36d4e550b128a94148b50fd92bf247a53e3298e2e0144c4a732382"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
