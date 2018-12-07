RPIFW_DATE = "20181206"
SRCREV = "077fbe8e06f0264a8fa9886e65aa21486fd7659f"
SRC_URI[md5sum] = "52a8bc8a0a759777cf25c7a89a7634dc"
SRC_URI[sha256sum] = "40223ffffeeb0caf35568fd91a7698ad47e9c3a5c522d410ffee0a656cbb955c"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
