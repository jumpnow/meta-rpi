RPIFW_SRCREV = "c37de45f2f4a1bfcbdb3c3fd7fc88df6c28bfcd3"
RPIFW_DATE = "20161115"
RPIFW_SRC_URI = "git://github.com/raspberrypi/firmware.git;protocol=git;branch=master"
RPIFW_S = "${WORKDIR}/git"

SRCREV = "${RPIFW_SRCREV}"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=4a4d169737c0786fb9482bb6d30401d1"

PR = "r25"
