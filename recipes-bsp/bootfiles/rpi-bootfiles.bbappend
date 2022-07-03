RPIFW_DATE = "20220627"
SRCREV = "ae17aabd2232fc43c35849053470745b1e814cf3"
SRC_URI[md5sum] = "5a13ff7f539026514a62a29863fd7988"
SRC_URI[sha256sum] = "b33dadece47cb167de8606cd834d5b33705d11648611c262c2443f7a3223811c"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
