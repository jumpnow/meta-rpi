RPIFW_DATE = "20231023"
SRCREV = "a3b20e7dd41aa174ae50b872c8c9c66beafd63e2"
SRC_URI[sha256sum] = "4c39f37f772a0bdcbd11aa882b9069eb09077f3f25d5811d817ca808a49a940a"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}

INSANE_SKIP:${PN} += "src-uri-bad"
