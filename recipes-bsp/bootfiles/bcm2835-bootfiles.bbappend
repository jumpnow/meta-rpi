RPIFW_DATE = "20180711"
SRCREV = "418b77e24476a98aba4ee33942cc5321e6698ce4"
SRC_URI[md5sum] = "e938b9acb6706d5d7b857176848e1bd3"
SRC_URI[sha256sum] = "25c04d9e5b0d9dfe3145784c983460b6e47f370c2082ced45392882d55932b8a"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
