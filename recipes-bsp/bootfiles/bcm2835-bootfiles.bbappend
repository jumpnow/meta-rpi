RPIFW_DATE = "20170730"
SRCREV = "92a16f14a9bda3b402440eada849fecf79f78859"
SRC_URI[md5sum] = "007d25bcc4b8212a2a7bb8835efc47e3"
SRC_URI[sha256sum] = "a0d82386deb2f1dfc376b7a157cccbf769eb8b44e8bac89f4da4d22f1107ee41"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r70"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
