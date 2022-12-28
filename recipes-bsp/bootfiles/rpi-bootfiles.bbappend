RPIFW_DATE = "20221219"
SRCREV = "4849b548c1ffda841481c54e62fff249ed00b32c"
SRC_URI[md5sum] = "20374b17fe146ab833bfa15b027b3593"
SRC_URI[sha256sum] = "dd36bff60c4c3a995dd559da50b47af217b72da20c7d34554823b2a8d5473163"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
