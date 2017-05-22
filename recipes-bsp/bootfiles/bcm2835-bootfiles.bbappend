RPIFW_DATE = "20170521"
SRCREV = "b9dbf8cf1a4609d16304c3f2740e97d5057d9a1a"
SRC_URI[md5sum] = "c3123223c988fa35b9376d4be1902e86"
SRC_URI[sha256sum] = "ce744f55bf9105f20f6111c7810055414514564b8a73ba536bb31c532f369002"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r58"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
