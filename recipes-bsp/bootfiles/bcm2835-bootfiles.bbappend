RPIFW_DATE = "20181130"
SRCREV = "b428bdd819df8d0ad3009b64492a4b3d1f9453e4"
SRC_URI[md5sum] = "29589574466227157b08817576664449"
SRC_URI[sha256sum] = "c5492204c1a1c8848bf2e844fd800f25447f639c628f8745f28ef703c21e65b5"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
