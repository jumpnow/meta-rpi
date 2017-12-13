RPIFW_DATE = "20171205"
SRCREV = "62640e817022402e71edf7718828ec643e6fbd35"
SRC_URI[md5sum] = "02b307a7a58274233a67ececf3bf2b10"
SRC_URI[sha256sum] = "b27860ee7c8ac257422b224b440b002944aae54fee60933b894ddfe82cc8be78"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r89"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
