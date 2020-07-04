RPIFW_DATE = "20200702"
SRCREV = "66fc5eaac3d0af1d5a7ffa616086cbfaefd72e98"
SRC_URI[md5sum] = "358418802b9380b5dff9b5e7179663d6"
SRC_URI[sha256sum] = "b46dbd6701e6beb13a12cb29dc88537e6557078965f7e5489db22fcd3f0895a8"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
