RPIFW_DATE = "20180719"
SRCREV = "bffe7ee6b276f23822883f3d7fd7b705d12c26b9"
SRC_URI[md5sum] = "7b4133984a64db0b48eca4cf7f53f150"
SRC_URI[sha256sum] = "59c3b8a817c6e40f34ce7e0d2f1b3f84bbec70761f306ca373aa12a6c3edb6c7"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
