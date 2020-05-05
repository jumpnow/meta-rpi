RPIFW_DATE = "20200501"
SRCREV = "7eff9f6774bb43bfd61e749a0b45ffddc98c2311"
SRC_URI[md5sum] = "05cd161dca5a6f02684794960913e04c"
SRC_URI[sha256sum] = "77ad450dd7cabb58ca04a18fd704844df6e642374346cf006a07edca46615af1"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
