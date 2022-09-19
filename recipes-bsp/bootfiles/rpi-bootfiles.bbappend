RPIFW_DATE = "20220916"
SRCREV = "93c576380c7bb20a6177f3163f01bc84445cc0e1"
SRC_URI[md5sum] = "49bcf405019e3ec2fb781fce44ae54ba"
SRC_URI[sha256sum] = "c535b73a4d9e68b696a1ea58ef6dfbd4fc67f00a0232bcc86952622fd45e8b36"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
