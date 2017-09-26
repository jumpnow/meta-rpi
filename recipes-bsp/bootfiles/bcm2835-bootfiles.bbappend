RPIFW_DATE = "20170924"
SRCREV = "f8d2f54774d22bee6420f63554e7edf9495a571a"
SRC_URI[md5sum] = "8fce77ab089fc970a8ebdeda1ba50d3a"
SRC_URI[sha256sum] = "eaec5bb699ebcdec4971dc32eb33719dd4139e180a4ab86ebd77c9baf4db363f"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r79"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
