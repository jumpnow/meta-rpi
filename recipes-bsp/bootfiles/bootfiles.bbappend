RPIFW_DATE = "20201008"
SRCREV = "63b192231130f1bdd074f3ae0794889d53bdeb06"
SRC_URI[md5sum] = "c67001b51a9d32d643e43b4e986a5933"
SRC_URI[sha256sum] = "35a48c39e1a0e629f888332dc85d59a53e4e873631dfadc881b7ceebde871120"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
