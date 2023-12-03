RPIFW_DATE = "20231129"
SRCREV = "5ffb2e29c0e14dede001447a6977e126e950cf3e"
SRC_URI[sha256sum] = "70810987352f8f9d88fc729cce3ad5fa6c03a69e5702a8ba7b2bb797f23be5d5"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}

INSANE_SKIP:${PN} += "src-uri-bad"
