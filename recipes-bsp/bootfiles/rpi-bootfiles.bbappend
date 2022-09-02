RPIFW_DATE = "20220826"
SRCREV = "ecc243c52789f4d8e837c7300b6effb059dc18c0"
SRC_URI[md5sum] = "937c117b0b99173bdd396a953367ec22"
SRC_URI[sha256sum] = "a1307af060b8057a5d202685a54993f9209cf67d3b071d826e305c78b849f46e"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
