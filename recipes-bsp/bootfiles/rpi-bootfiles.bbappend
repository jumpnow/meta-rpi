RPIFW_DATE = "20231121"
SRCREV = "8972935fd0c01940bb5fe0004402f554e71ce2e2"
SRC_URI[sha256sum] = "74cbef45bf26a6fcfb00f514df6a7256e01fb104f31fd67f9f960429bb82455a"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}

INSANE_SKIP:${PN} += "src-uri-bad"
