RPIFW_DATE = "20190809"
SRCREV = "66bafab005569e3eb92ec54cd3efeee3da338738"
SRC_URI[md5sum] = "0697b41a2a9130287784d85920e4917b"
SRC_URI[sha256sum] = "b3a8bd532ca38f90e322be9fe4858a974e04ba8254248e416bf9e9ec5f176d95"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
