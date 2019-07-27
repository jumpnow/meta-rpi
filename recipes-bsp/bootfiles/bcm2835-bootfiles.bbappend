RPIFW_DATE = "20190725"
SRCREV = "56e23d83c456bf36eb798fcd7c7271675e082f1b"
SRC_URI[md5sum] = "db11ee80bcb2163eef10820f60e8a5c6"
SRC_URI[sha256sum] = "c8d411ad15a393bbd25ca2c1e71ab0d26432e0f39eaac7d7c26f0c60e784ca09"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
