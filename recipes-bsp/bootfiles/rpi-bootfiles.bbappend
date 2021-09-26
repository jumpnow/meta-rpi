RPIFW_DATE = "20210923"
SRCREV = "fde2999b0702acfbc57751421788a579023e2ce8"
SRC_URI[md5sum] = "b767c3a5c39ddd5b3c8def5199bf3150"
SRC_URI[sha256sum] = "cc571beb39e3b3b6a930358121f9137bb463e7d17eaa5c5c52bc87e99db72724"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
