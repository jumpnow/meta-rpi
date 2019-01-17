RPIFW_DATE = "20190116"
SRCREV = "c589f89f8df058f8aaac563227fb912a4e1dc88c"
SRC_URI[md5sum] = "4c72e33343966c27b11d67da45316b33"
SRC_URI[sha256sum] = "2b9f86b73f1b5b9dedddcc622f2c10cf04259674bccda06ce022f490456a29cf"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
