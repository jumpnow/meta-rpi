RPIFW_DATE = "20200826"
SRCREV = "1a2131e68b556d781cd11f544ec0633beff82cba"
SRC_URI[md5sum] = "f6da21cccb3a47af064caf7f74be70b3"
SRC_URI[sha256sum] = "003993a0dfc405e3e111ef3620c7aca7b58c2613a118d850f2a459897764bc00"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
