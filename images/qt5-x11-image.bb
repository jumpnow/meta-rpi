SUMMARY = "A Qt5 development image"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require x11-image.bb

QT_TOOLS = " \
    qtbase \
    qtbase-dev \
    qtbase-fonts \
    qtbase-mkspecs \
    qtbase-plugins \
    qtbase-tools \
    qt5-env \
 "

IMAGE_INSTALL += " \
    ${QT_TOOLS} \
    qcolorcheck \
    tspress \
 "

export IMAGE_BASENAME = "qt5-x11-image"

