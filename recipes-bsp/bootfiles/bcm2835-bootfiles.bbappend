RPIFW_DATE = "20180910"
SRCREV = "70c60c5c57d9d639fbd92276f18558ada51b7c53"
SRC_URI[md5sum] = "e6b9ad41b1c8d9c7c5e3c41ac71ec9c7"
SRC_URI[sha256sum] = "4cb43c57e8fbfe81d27653d273a9f2f20f9ac497464770c3b06531de947ad3dc"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
