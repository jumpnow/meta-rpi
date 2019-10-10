RPIFW_DATE = "20191007"
SRCREV = "f8a89246a793911701b9f255bb6ba34a0b93479e"
SRC_URI[md5sum] = "cb573e0228f68aa7c2a465c446fbd6cc"
SRC_URI[sha256sum] = "303b3c122577a7aabb69a4a70d0fefc02b5ddcb44a4cc82b6fa0d45aaa50bbe5"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
