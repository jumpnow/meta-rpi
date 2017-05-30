SUMMARY = "Flask testing"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require console-basic-image.bb

FLASK = " \
    python-flask \
    python-bcrypt \
    python-flask-bootstrap \
    python-flask-login \
    python-flask-navigation \
    python-flask-sqlalchemy \
    python-flask-wtf \
"

EXTRAS = " \
    sqlite3 \
"

MQTT = " \
    python-paho-mqtt \
"

IMAGE_INSTALL += " \
    ${EXTRAS} \
    ${FLASK} \
    ${MQTT} \
"

disable_unused_services() {
    rm ${IMAGE_ROOTFS}/etc/rc5.d/S15mountnfs.sh
}

ROOTFS_POSTPROCESS_COMMAND += " \
    disable_unused_services ; \
 "

export IMAGE_BASENAME = "flask-image"
