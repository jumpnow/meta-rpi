RPIFW_SRCREV = "4b79411d54bbefb6f89cf1fc76edd7cd4940ec35"
RPIFW_DATE = "20170419"
RPIFW_SRC_URI = "git://github.com/raspberrypi/firmware.git;protocol=git;branch=master"
RPIFW_S = "${WORKDIR}/git"

SRCREV = "${RPIFW_SRCREV}"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=4a4d169737c0786fb9482bb6d30401d1"

PR = "r51"
