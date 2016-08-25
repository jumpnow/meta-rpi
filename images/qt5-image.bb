SUMMARY = "A Qt5 development image"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require console-image.bb

QT_TOOLS = " \
    qtbase \
    qtbase-dev \
    qtbase-fonts \
    qtbase-mkspecs \
    qtbase-plugins \
    qtbase-tools \
    qt5-env \
"

QT_SERIALPORT = " \
    qtserialport-dev \
    qtserialport-mkspecs \
"

IMAGE_INSTALL += " \
    ${QT_TOOLS} \
    ${QT_SERIALPORT} \
    qcolorcheck \
    qfontchooser \
    qkeytest \
    qshowfonts \
    tspress \
"

export IMAGE_BASENAME = "qt5-image"
