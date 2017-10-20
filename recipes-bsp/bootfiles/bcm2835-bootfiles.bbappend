RPIFW_DATE = "20171013"
SRCREV = "478d637c476e838ffcfa8535232ff0b86daf5918"
SRC_URI[md5sum] = "c3bbc9f5652aafe92e230e30ad83d161"
SRC_URI[sha256sum] = "dd22d43cfd5d272c8d62ff98b2f31f702d6185dd6d3bab05da30b54b71c7e14e"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r82"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
