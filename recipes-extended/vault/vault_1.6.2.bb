DESCRIPTION = "HashiCorp Vault - A tool for managing secrets"
HOMEPAGE = "https://www.vaultproject.io/"

LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=815ca599c9df247a0c7f619bab123dad"

SRC_URI = " \
    https://releases.hashicorp.com/vault/${PV}/vault_${PV}_linux_arm.zip \
"

SRC_URI[sha256sum] = "58ea30ad563d6c908aa00ce8985279d41343ecca227252066f3f43f1f1de396e"

S = "${WORKDIR}"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${S}/${PN} ${D}${bindir}/vault
}

FILES_${PN} = "${bindir}"
