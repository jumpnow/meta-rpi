RPIFW_DATE = "20180921"
SRCREV = "404dfef3b364b4533f70659eafdcefa3b68cd7ae"
SRC_URI[md5sum] = "c1531215767fc3cc5c632799eac7252e"
SRC_URI[sha256sum] = "4865e130fd1a6f9d97978da228a20d90e5a84daea3a5e6da8f828cbf640d7083"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
