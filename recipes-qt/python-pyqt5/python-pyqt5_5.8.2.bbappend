PV = "5.9.2"
SRC_URI[md5sum] = "33d6d2ab8183da17ac18b8132a4b278e"
SRC_URI[sha256sum] = "c190dac598c97b0113ca5e7a37c71c623f02d1d713088addfacac4acfa4b8394"

SRC_URI = "\
    ${SOURCEFORGE_MIRROR}/pyqt/PyQt5_gpl-${PV}.tar.gz \
"


# remove dependency on qt4-x11-free because our Qt5 runs on eglfs
REQUIRED_DISTRO_FEATURES=""

# add some additional modules
PYQT_MODULES_append = " QtQml QtQuick QtMultimedia QtSerialPort"

DEPENDS_append = " qtdeclarative qtmultimedia qtserialport"
