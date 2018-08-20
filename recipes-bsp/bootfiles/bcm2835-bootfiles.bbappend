RPIFW_DATE = "20180816"
SRCREV = "ebbecf992a466f9bffbd9e3f443f56f64994a277"
SRC_URI[md5sum] = "65d24c7b61b60d80b8f4f630fc53cdcc"
SRC_URI[sha256sum] = "b23af42de1db8940767d96a7a7eb86837d55a66d5d562576d975446f454874ae"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
