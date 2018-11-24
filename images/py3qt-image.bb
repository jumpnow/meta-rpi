SUMMARY = "A PyQt5 development image"

require qt5-image.bb

QT5_PKGS += " \
    python-pyqt5 \
    pytouch \
"

export IMAGE_BASENAME = "pyqt5-image"
