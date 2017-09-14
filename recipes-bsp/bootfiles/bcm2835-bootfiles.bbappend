RPIFW_DATE = "20170914"
SRCREV = "eb04fcf96b9ff37d00919ce4e1999f802ed8976f"
SRC_URI[md5sum] = "06061467849831387de0824b6c7a50ce"
SRC_URI[sha256sum] = "d0b4a5809c3855035845987f26f8be90f170386149225e4383de91ca32b06139"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r78"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
