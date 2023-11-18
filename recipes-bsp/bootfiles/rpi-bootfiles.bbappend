RPIFW_DATE = "20231102"
SRCREV = "83dafbc92c0e63f76ca2ecdd42462d56489d1c77"
SRC_URI[sha256sum] = "dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}

INSANE_SKIP:${PN} += "src-uri-bad"
