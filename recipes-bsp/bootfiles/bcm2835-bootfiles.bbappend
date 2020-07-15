RPIFW_DATE = "20200713"
SRCREV = "7e74bcb4f9706f36f752d1c3d3164628ccf2aae5"
SRC_URI[md5sum] = "46a19d68b81f388443394492dd6a873c"
SRC_URI[sha256sum] = "f987cafcbc72179493673191e3e4aa8c1f18eccf871546be5d26156abbf8eff1"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
