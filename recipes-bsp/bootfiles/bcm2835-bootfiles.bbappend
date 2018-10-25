RPIFW_DATE = "20181023"
SRCREV = "45c6ee3cd7f36a2376b691affbc02dfc689b8056"
SRC_URI[md5sum] = "c4a007850a8c9fd95a86578fdc836f08"
SRC_URI[sha256sum] = "d9295b794e8a93a9bb8b5fe8cf612fea7f4a22f4a8abbbd3f56a20c96e63428a"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
