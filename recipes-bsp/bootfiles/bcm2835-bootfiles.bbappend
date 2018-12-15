RPIFW_DATE = "20181211"
SRCREV = "de8589ef09567f12508faedc8ced3046b078e9b5"
SRC_URI[md5sum] = "077b7bff0c35f9a0b9b0978dd4f221cb"
SRC_URI[sha256sum] = "748f6443134abad39ec9d57423b19d219f51fc362500bb4760fe415520b4fbe5"

RPIFW_SRC_URI = "https://codeload.github.com/raspberrypi/firmware/tar.gz/${SRCREV}"
RPIFW_S = "${WORKDIR}/firmware-${SRCREV}"

do_unpack() {
    tar -C ${WORKDIR} -xzf ${DL_DIR}/${SRCREV}
}
