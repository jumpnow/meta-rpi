RPIFW_DATE = "20180201"
SRCREV = "58395c1ea3f9ae129885aa7ff7d8b92c7be267db"
SRC_URI[md5sum] = "a74799305c72b514f2881ae83eafb145"
SRC_URI[sha256sum] = "9ceb26e9086a13689b7bfe20e4790e9b99e2c4a769ec2c2c5fb358ff6e3474cf"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
