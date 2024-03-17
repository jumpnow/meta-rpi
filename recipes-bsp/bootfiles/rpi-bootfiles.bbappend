RPIFW_DATE = "20240314"
SRCREV = "40ac9ca411ba2a0947061712a379a43579a33c0c"
SRC_URI[sha256sum] = "327f6140db00be514e9e6163949bba362c9ddf2d474527ee7bad5cf6ebba1990"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}

INSANE_SKIP:${PN} += "src-uri-bad"
