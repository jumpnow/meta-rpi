RPIFW_DATE = "20171212"
SRCREV = "64f0ee15c2abaced76cea0310b9e41ea59bd4487"
SRC_URI[md5sum] = "d6987568a508d839734c0df24b8d4e50"
SRC_URI[sha256sum] = "fa9e1b987cc5628fa5a44699e1168ff6b418a1416108db25c611b87524ad04dd"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
