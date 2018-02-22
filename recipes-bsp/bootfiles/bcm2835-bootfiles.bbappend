RPIFW_DATE = "20180220"
SRCREV = "9ab68bf218ffc84423a2591658260676d373259a"
SRC_URI[md5sum] = "603be4afaf614adff4ad6400392bdd5d"
SRC_URI[sha256sum] = "b8f77733663a37755fce803b26a91f1f213c52a22926e94fd402d77efc9b8171"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
