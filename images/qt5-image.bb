SUMMARY = "A Qt5 development image"

require qt5-basic-image.bb

QT5_DEV_PKGS = " \
    qt3d-dev \
    qt3d-mkspecs \
    qtcharts-dev \
    qtcharts-mkspecs \
    qtconnectivity-dev \
    qtconnectivity-mkspecs \
    qtdeclarative-dev \
    qtdeclarative-mkspecs \
    qtgraphicaleffects-dev \
    qtlocation-dev \
    qtlocation-mkspecs \
    qtmultimedia-dev \
    qtmultimedia-mkspecs \
    qtquickcontrols2-dev \
    qtquickcontrols2-mkspecs \
    qtsensors-dev \
    qtsensors-mkspecs \
    qtserialbus-dev \
    qtserialbus-mkspecs \
    qtsvg-dev \
    qtsvg-mkspecs \
    qtwebsockets-dev \
    qtwebsockets-mkspecs \
    qtvirtualkeyboard-dev \
    qtxmlpatterns-dev \
    qtxmlpatterns-mkspecs \
"

QT5_PKGS = " \
    qt3d \
    qtcharts \
    qtdeclarative \
    qtdeclarative-plugins \
    qtdeclarative-qmlplugins \
    qtgraphicaleffects \
    qtlocation-plugins \
    qtmultimedia \
    qtquickcontrols2 \
    qtsensors-plugins \
    qtserialbus \
    qtsvg \
    qtwebsockets-qmlplugins \
    qtvirtualkeyboard \
    qtxmlpatterns \
"

TEST_APPS += " \
    qmlswipe-tools \
    qt5-opengles2-test \
"

IMAGE_INSTALL += " \
    ${QT5_DEV_PKGS} \
    ${QT5_PKGS} \
    ${TEST_APPS} \
"

export IMAGE_BASENAME = "qt5-image"
