RPIFW_DATE = "20180117"
SRCREV = "9bcdc309ac0501129ec57d86892b5cd6a205f054"
SRC_URI[md5sum] = "1839e8d473b4073b34fd1a1f86a38920"
SRC_URI[sha256sum] = "67c49e0e99852a8d302568fd175c62e0e4957be5a3e94ada158a1fc260c74fec"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
