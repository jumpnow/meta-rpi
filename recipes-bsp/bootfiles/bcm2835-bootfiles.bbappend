RPIFW_DATE = "20170904"
SRCREV = "6573dfd77ddac9400cf7dd1dd3998b120f6c666c"
SRC_URI[md5sum] = "5a7bf289b78e9e651417a8df0b5f6ad8"
SRC_URI[sha256sum] = "08e668bf893112914df8fedbd1b298e324ba08c1050ed2dab111affa1fc7a188"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r76"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
