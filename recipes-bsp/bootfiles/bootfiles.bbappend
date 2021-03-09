RPIFW_DATE = "20210225"
SRCREV = "5985247fb75681985547641d66196c77499f26b9"
SRC_URI[md5sum] = "5bda3cf30c6c50d83baaeff640cc5372"
SRC_URI[sha256sum] = "3e2c00e1473bd70e808134925e1b25cd765789d9f0e0683749135b124d835000"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
