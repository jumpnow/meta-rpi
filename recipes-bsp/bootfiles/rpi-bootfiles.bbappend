RPIFW_DATE = "20210930"
SRCREV = "b5257da58c0e652633592c6fce09a7f3b100a2eb"
SRC_URI[md5sum] = "5535a5bca049fc1c60e99506e75fe958"
SRC_URI[sha256sum] = "89c9ce0bcead33e17dc53eba432a85afc55183223bd81bf754340a925690a3a5"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
