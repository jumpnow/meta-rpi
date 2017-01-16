RPIFW_SRCREV = "88f75aef50fb2d0165f1bdbe43d7fcf3f5397c02"
RPIFW_DATE = "20170115"
RPIFW_SRC_URI = "git://github.com/raspberrypi/firmware.git;protocol=git;branch=master"
RPIFW_S = "${WORKDIR}/git"

SRCREV = "${RPIFW_SRCREV}"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=4a4d169737c0786fb9482bb6d30401d1"

PR = "r33"
