RPIFW_DATE = "20171201"
SRCREV = "9426e18b87b343b84280ad2e4151863e36595c4a"
SRC_URI[md5sum] = "de2c8ed14f6ee71ddbec43a2397e1aad"
SRC_URI[sha256sum] = "d09b626141655e521e3fb76d8a5a0d7f2787bb20429f38924c38addde3f680bf"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r88"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
