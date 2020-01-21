RPIFW_DATE = "20200116"
SRCREV = "be2713bed42381f36c38670d26e9b85780b6233c"
SRC_URI[md5sum] = "344ff74c9b584187de4ec693082ac437"
SRC_URI[sha256sum] = "eea38f16585e7f471cf9d05b19a6a942536e5ad25d845a6905940446f951fb55"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
