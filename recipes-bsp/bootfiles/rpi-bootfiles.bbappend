RPIFW_DATE = "20210525"
SRCREV = "fb0bfa6a669745578041e838fc73cc17e8c543c9"
SRC_URI[md5sum] = "a757513cfd5a2064bf893a619531fd71"
SRC_URI[sha256sum] = "0bdf7e4e0c142020dc4c2642cc641b1490fac4b2989f5f5f2f246a9e0e3269af"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
