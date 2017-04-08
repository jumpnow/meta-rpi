SUMMARY = "An RPi access point"
HOMEPAGE = "http://www.jumpnowtek.com"

require iot-image.bb

AP_TOOLS = " \
    hostapd \
    iptables \
    dnsmasq \
"

IMAGE_INSTALL += " \
    ${AP_TOOLS} \
"

export IMAGE_BASENAME = "ap-image"
