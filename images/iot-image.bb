SUMMARY = "A basic console dev image for doing some IOT work"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require console-image.bb

MQTT = " \
    libmosquitto1 \
    libmosquittopp1 \
    mosquitto \
    mosquitto-dev \
    mosquitto-clients \
    python-paho-mqtt \
"

PYTHON_WEB = " \
    python-flask \
"

IMAGE_INSTALL += " \
    ${MQTT} \
    ${PYTHON_WEB} \
"

export IMAGE_BASENAME = "iot-image"
