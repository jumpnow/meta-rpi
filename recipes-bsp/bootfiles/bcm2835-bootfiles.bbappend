RPIFW_DATE = "20170722"
SRCREV = "1676ddb0792f1d1678efed0399c55128bc8203a6"
SRC_URI[md5sum] = "6c537f0f5baa1236ad1402ac364230ec"
SRC_URI[sha256sum] = "ba4509312be06a6cc232d8fbe6a738a082e903b758dcae4eaee068ec2e2dec4d"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

PR = "r67"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
