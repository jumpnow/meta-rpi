RPIFW_DATE = "20190528"
SRCREV = "e289f6a59ff24925aa29f134723659b8bcd9fa06"
SRC_URI[md5sum] = "1ac5b16c70a790d6b69424d17da6d4ec"
SRC_URI[sha256sum] = "d5892ebb528d76f9d46fb6e9726da1069a31c4211ec82689f24b90ea13b64075"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
