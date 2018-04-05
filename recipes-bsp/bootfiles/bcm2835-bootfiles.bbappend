RPIFW_DATE = "20180328"
SRCREV = "c14a90333c13f507ab219d583b74a998ec11a6e7"
SRC_URI[md5sum] = "f671444b8acba9b67cd04a419c6624c9"
SRC_URI[sha256sum] = "aa683697d9767bfd0d1cfb41c3f01fdf782e92122638a156c55f104b47d5e636"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
