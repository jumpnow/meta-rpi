RPIFW_SRCREV = "b84b5f08db920a1cafb838bb2914b9dcf7c597da"
RPIFW_DATE = "20170308"
RPIFW_SRC_URI = "git://github.com/raspberrypi/firmware.git;protocol=git;branch=master"
RPIFW_S = "${WORKDIR}/git"

SRCREV = "${RPIFW_SRCREV}"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=4a4d169737c0786fb9482bb6d30401d1"

PR = "r43"
