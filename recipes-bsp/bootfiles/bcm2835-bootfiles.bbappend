RPIFW_DATE = "20171029"
SRCREV = "89a2371a9fa4faf34e87412471eb12fe530c65e4"
SRC_URI[md5sum] = "35bf356b88d765445d981ce74e5d6c3f"
SRC_URI[sha256sum] = "f786f9a15d82f8736c295923b229f8c755c289936127c54f6d11f26ef1805461"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r85"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
