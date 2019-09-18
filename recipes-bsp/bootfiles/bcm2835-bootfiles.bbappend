RPIFW_DATE = "20190917"
SRCREV = "f8e05108dbb3b5640f48b6b301296e979876836b"
SRC_URI[md5sum] = "6be87554e4079653c631e81d1ca23e2c"
SRC_URI[sha256sum] = "cf6db3b500af7ba4cfa7dc3e4fdac9f3bc74e6abde7877f4e22920724d3e88a6"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
