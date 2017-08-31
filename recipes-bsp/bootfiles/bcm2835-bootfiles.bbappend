RPIFW_DATE = "20170830"
SRCREV = "625e7683c429eb7320339c69bc0984fa3223783d"
SRC_URI[md5sum] = "24c3ec9cb468304a5e9949c27f8ec2a2"
SRC_URI[sha256sum] = "cc74192b2e379f65e1c59b34a1b1171f22f66a644d2ae00db80d2d5546ce0b6b"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r75"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
