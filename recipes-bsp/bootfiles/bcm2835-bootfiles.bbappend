RPIFW_DATE = "20171218"
SRCREV = "30114a878f2aea7b4c29eaaf6efc3651885b1f5f"
SRC_URI[md5sum] = "7e0e6aca6cfb5bfe2da43dce08021ea5"
SRC_URI[sha256sum] = "345b0cd3325efcf203c2b261c57e0f3517c7a8c5966aa2922cb9348a7bd3d163"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
