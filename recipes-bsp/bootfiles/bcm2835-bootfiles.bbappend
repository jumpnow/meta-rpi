RPIFW_DATE = "20180518"
SRCREV = "a46b1f9521229ec26a1377aab7d013df1ade2791"
SRC_URI[md5sum] = "328b90f6dece0376b534b49f935efd13"
SRC_URI[sha256sum] = "f2b0f8ec8e73f8fa399f2c72c574ea5fe7fa57ab6151b139842a3ba783cd2140"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
