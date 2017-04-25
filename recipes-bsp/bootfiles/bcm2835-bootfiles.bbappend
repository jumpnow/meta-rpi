RPIFW_SRCREV = "570b095e08fa90c39e30cf8c48b84411377ff0f4"
RPIFW_DATE = "20170422"
RPIFW_SRC_URI = "git://github.com/raspberrypi/firmware.git;protocol=git;branch=master"
RPIFW_S = "${WORKDIR}/git"

SRCREV = "${RPIFW_SRCREV}"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=4a4d169737c0786fb9482bb6d30401d1"

PR = "r52"
