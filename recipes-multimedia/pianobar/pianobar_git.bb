CRIPTION = "Console-based pandora.com player"
AUTHOR = "Lars-Dominik Braun <lars@6xq.net>"
HOMEPAGE = "https://6xq.net/pianobar/"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=cfeb8ae0065c00f1bf4f5a963872e934"

DEPENDS = "libao gnutls libgcrypt json-c faad2 ffmpeg curl"

PR = "r2"

SRCREV = "0ec2df77a72edde7b65a4ac8e7ffff4470120a51"
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

RDEPENDS_${PN} += "libao-plugin-libalsa"

FILES_${PN} = "${bindir} ${datadir}"
