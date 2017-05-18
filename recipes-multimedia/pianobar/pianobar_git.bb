DESCRIPTION = "Console-based pandora.com player"
AUTHOR = "Lars-Dominik Braun <lars@6xq.net>"
HOMEPAGE = "https://6xq.net/pianobar/"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=cfeb8ae0065c00f1bf4f5a963872e934"

DEPENDS = "curl faad2 ffmpeg gnutls json-c libao libgcrypt"

PR = "r6"

inherit pkgconfig

SRCREV = "700c807d87100b2b8011388fff2117c6d8a69570"
SRC_URI = " \
    git://github.com/PromyLOPh/pianobar;protocol=git \
    file://config \
 "

S = "${WORKDIR}/git"

do_compile () {
    oe_runmake 'PREFIX=${D}${prefix}' 'DISABLE_MAD=1'
}

do_install () {
    oe_runmake 'PREFIX=${D}${prefix}' 'DISABLE_MAD=1' install

    install -d ${D}${datadir}/pianobar
    install -m 0664 ${WORKDIR}/config ${D}${datadir}/pianobar/config 
}

pkg_postinst_${PN}() {
    if [ ! -d $D/home/root/.config/pianobar ]; then
        mkdir -p $D/home/root/.config/pianobar
        cp $D/${datadir}/pianobar/config $D/home/root/.config/pianobar/config
    fi
}

RDEPENDS_${PN} += "libao-plugin-libalsa libavfilter"

FILES_${PN} = "${bindir} ${datadir}"
