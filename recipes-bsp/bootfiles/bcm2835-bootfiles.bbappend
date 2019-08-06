RPIFW_DATE = "20190801"
SRCREV = "3822340923e5cddc772492386d82ba00f4275d62"
SRC_URI[md5sum] = "ac9ac39a3adc7b6fba0aa3720aa10249"
SRC_URI[sha256sum] = "35a5b0a30cdc68aeeda355a506dc967bc5de5cf7fc94e90367d979bff0a0f0bb"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
