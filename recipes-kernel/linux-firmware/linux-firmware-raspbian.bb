SUMMARY = "Firmware files for use with Linux kernel"
SECTION = "kernel"

LICENSE = "Firmware-broadcom_bcm43xx"
LIC_FILES_CHKSUM = "file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc"

NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"

SRCREV = "86e88fbf0345da49555d0ec34c80b4fbae7d0cd3"
SRC_URI = "git://github.com/RPi-Distro/firmware-nonfree"

S = "${WORKDIR}/git"

do_install() {
	install -d ${D}${nonarch_base_libdir}/firmware
    install -m 644 ${S}/LICENCE.broadcom_bcm43xx ${D}${nonarch_base_libdir}/firmware

	install -d ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 644 ${S}/brcm/brcmfmac43430-sdio.txt ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 644 ${S}/brcm/brcmfmac43430-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 644 ${S}/brcm/brcmfmac43455-sdio.txt ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 644 ${S}/brcm/brcmfmac43455-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 644 ${S}/brcm/brcmfmac43455-sdio.clm_blob ${D}${nonarch_base_libdir}/firmware/brcm
}

FILES_${PN} = "${nonarch_base_libdir}"
