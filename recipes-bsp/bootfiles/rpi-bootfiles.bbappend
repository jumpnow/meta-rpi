RPIFW_DATE = "20211015"
SRCREV = "fc00a05eab703011afb2fc1c8f3ef77b65120fe4"
SRC_URI[md5sum] = "0677e0fdfd04fb6dfc9b189498348358"
SRC_URI[sha256sum] = "d6ec7843483d0a4abc80d1b5842aa0fe777b42c4a6d7ebf3a46fac981d99389a"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
