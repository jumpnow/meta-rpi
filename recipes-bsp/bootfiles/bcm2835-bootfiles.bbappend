RPIFW_DATE = "20170530"
SRCREV = "0f315f88ac91f9be93544bfd757f8d55ca4cf099"
SRC_URI[md5sum] = "2fe42603602158796625989c73e5088b"
SRC_URI[sha256sum] = "79dcd9f47fbae16e9ec80f96a48e4e04c0ee2076ddbb7f73429510d812a8ef89"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r60"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
