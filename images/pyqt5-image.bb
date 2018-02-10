SUMMARY = "A PyQt5 development image"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require qt5-image.bb

QT5_PKGS += " \
    python-pyqt5 \
"

export IMAGE_BASENAME = "pyqt5-image"
