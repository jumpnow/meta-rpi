RPIFW_DATE = "20200220"
SRCREV = "02bff4e75712094ffb1ab2ec58a8115ca3e52290"
SRC_URI[md5sum] = "0ff79476623af1182f6ddc4baeb7d2ed"
SRC_URI[sha256sum] = "08188344f592aecfa611a268b89762f7e48d08b1242185cb2627bb28e59d5f1a"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
