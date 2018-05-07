RPIFW_DATE = "20180505"
SRCREV = "287af2a2be0787a5d45281d1d6183a2161c798d4"
SRC_URI[md5sum] = "a8e00988a0412998b84f3139bc340b4e"
SRC_URI[sha256sum] = "5edff641f216d2e09c75469dc2e9fc66aff290e212a1cd43ed31c499f99ea055"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
