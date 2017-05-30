SUMMARY = "A basic console dev image for doing some IOT work"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require console-basic-image.bb

MQTT = " \
    libmosquitto1 \
    libmosquittopp1 \
    mosquitto \
    mosquitto-dev \
    mosquitto-clients \
    python-paho-mqtt \
"

IMAGE_INSTALL += " \
    ${MQTT} \
"

disable_unused_services() {
    rm ${IMAGE_ROOTFS}/etc/rc5.d/S15mountnfs.sh
}

ROOTFS_POSTPROCESS_COMMAND += " \
    disable_unused_services ; \
 "

export IMAGE_BASENAME = "iot-image"
