RPIFW_DATE = "20181121"
SRCREV = "66be1927eafd2feed468efd36ec083b208f0a9c3"
SRC_URI[md5sum] = "b19fb79324e15672c39c5ef7977ad120"
SRC_URI[sha256sum] = "ec66825f0ac681e059ca090b0880b82e42726e5aa31102a8668d193c54d17eac"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
