RPIFW_DATE = "20180628"
SRCREV = "afc71fd252cc947b50b3140cb3935af9ab0f260d"
SRC_URI[md5sum] = "6dc87b5622922d277620b30e9b044916"
SRC_URI[sha256sum] = "90de06a815b26d2fe489d4055da1f65dbbad6c55201a8950f7ea9303685a09dd"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
