RPIFW_DATE = "20170724"
SRCREV = "9b85acd3fff8e1a57ceca9c57b56f82763051d2e"
SRC_URI[md5sum] = "5513304cb12e1ec0aa58c46ef89b92bd"
SRC_URI[sha256sum] = "c4391d7a429e360ce1b8ddd703ccb17c88a3915add66528061783412d4b1d0f6"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r68"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
