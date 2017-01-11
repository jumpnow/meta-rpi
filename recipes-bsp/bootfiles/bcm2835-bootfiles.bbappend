RPIFW_SRCREV = "06d1830c503701824e6d35598eaa7a5baea07141"
RPIFW_DATE = "20170109"
RPIFW_SRC_URI = "git://github.com/raspberrypi/firmware.git;protocol=git;branch=master"
RPIFW_S = "${WORKDIR}/git"

SRCREV = "${RPIFW_SRCREV}"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=4a4d169737c0786fb9482bb6d30401d1"

PR = "r32"
