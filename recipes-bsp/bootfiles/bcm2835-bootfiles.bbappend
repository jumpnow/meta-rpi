RPIFW_DATE = "20170625"
SRCREV = "ded4626a431bbdacea3281fc733df89c5cecfaeb"
SRC_URI[md5sum] = "d8a832305697e4608905683bd1daf34b"
SRC_URI[sha256sum] = "23858312a0de04fd5bd774fef11775a0540a2def05674f6d5a5776124b4829fc"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r63"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
