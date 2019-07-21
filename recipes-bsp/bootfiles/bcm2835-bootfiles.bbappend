RPIFW_DATE = "20190715"
SRCREV = "cba4be275b9943b353ea2e5201ab2badd4c760e9"
SRC_URI[md5sum] = "76e9c1dc65a9703373f24931b7df5e54"
SRC_URI[sha256sum] = "62a63b4a8be10da779342799148919d1a50c1939bf6cae93d61cb1b5daed810f"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
