RPIFW_DATE = "20180305"
SRCREV = "aa755336fc3f0430fb9175c9fe5f0e1d27f7dd54"
SRC_URI[md5sum] = "b42d4107d1a83b3a2e86b6f74a0af832"
SRC_URI[sha256sum] = "296015acbd615df7c3646fd357d949602bdb412850e20c2be2636912f6466140"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
