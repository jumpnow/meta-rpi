FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README.md;beginline=223;endline=247;md5=86d10e4bcf4b4014d306dde7c1d2a80d"

SRCREV = "d2869cee24903998a6e8baf3387b6238064e874b"
SRC_URI = "git://github.com/sarfata/pi-blaster \
           file://0001-remove-initscript-lsb-dependency.patch \
           file://0002-Set-period-to-50-ms-and-resolution-to-50-us.patch \
           file://0003-Fix-init.d-start-script-so-args-work.patch \
           file://default \
"

PR = "r1"

do_install_append() {
    install -d ${D}${sysconfdir}/default
    install -m 0664 ${WORKDIR}/default ${D}${sysconfdir}/default/pi-blaster
}

FILES_${PN} += "${sysconfdir}"
