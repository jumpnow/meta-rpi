LINUX_VERSION = "4.4.6"

SRCREV = "4558f488edf41daddd4bceed975f3af8cee89033"
SRC_URI = "git://github.com/raspberrypi/linux.git;protocol=git;branch=rpi-4.4.y"

PR = "r2"

require recipes-kernel/linux/linux-raspberrypi.inc

KERNEL_DEVICETREE = " \
    bcm2708-rpi-b.dtb \
    bcm2708-rpi-b-plus.dtb \
    bcm2709-rpi-2-b.dtb \
    bcm2710-rpi-3-b.dtb \
    \
    overlays/ads7846-overlay.dtb \
    overlays/at86rf233-overlay.dtb \
    overlays/bmp085_i2c-sensor-overlay.dtb \
    overlays/dht11-overlay.dtb \
    overlays/dwc2-overlay.dtb \
    overlays/dwc-otg-overlay.dtb \
    overlays/enc28j60-overlay.dtb \
    overlays/gpio-ir-overlay.dtb \
    overlays/gpio-poweroff-overlay.dtb \
    overlays/hifiberry-amp-overlay.dtb \
    overlays/hifiberry-dac-overlay.dtb \
    overlays/hifiberry-dacplus-overlay.dtb \
    overlays/hifiberry-digi-overlay.dtb \
    overlays/hy28a-overlay.dtb \
    overlays/hy28b-overlay.dtb \
    overlays/i2c-gpio-overlay.dtb \
    overlays/i2c0-bcm2708-overlay.dtb \
    overlays/i2c1-bcm2708-overlay.dtb \
    overlays/i2c-gpio-overlay.dtb \
    overlays/i2c-rtc-overlay.dtb \
    overlays/i2s-mmap-overlay.dtb \
    overlays/iqaudio-dac-overlay.dtb \
    overlays/iqaudio-dacplus-overlay.dtb \
    overlays/lirc-rpi-overlay.dtb \
    overlays/mcp2515-can0-overlay.dtb \
    overlays/mcp2515-can1-overlay.dtb \
    overlays/mmc-overlay.dtb \
    overlays/mz61581-overlay.dtb \
    overlays/pi3-disable-bt-overlay.dtb \
    overlays/pi3-miniuart-bt-overlay.dtb \
    overlays/piscreen2r-overlay.dtb \
    overlays/piscreen-overlay.dtb \
    overlays/pitft28-capacitive-overlay.dtb \
    overlays/pitft28-resistive-overlay.dtb \
    overlays/pps-gpio-overlay.dtb \
    overlays/pwm-2chan-overlay.dtb \
    overlays/pwm-overlay.dtb \
    overlays/raspidac3-overlay.dtb \
    overlays/rpi-backlight-overlay.dtb \
    overlays/rpi-dac-overlay.dtb \
    overlays/rpi-display-overlay.dtb \
    overlays/rpi-ft5406-overlay.dtb \
    overlays/rpi-proto-overlay.dtb \
    overlays/rpi-sense-overlay.dtb \
    overlays/sdhost-overlay.dtb \
    overlays/sdio-overlay.dtb \
    overlays/sdtweak-overlay.dtb \
    overlays/smi-dev-overlay.dtb \
    overlays/smi-nand-overlay.dtb \
    overlays/smi-overlay.dtb \
    overlays/spi1-1cs-overlay.dtb \
    overlays/spi1-2cs-overlay.dtb \
    overlays/spi1-3cs-overlay.dtb \
    overlays/spi2-1cs-overlay.dtb \
    overlays/spi2-2cs-overlay.dtb \
    overlays/spi2-3cs-overlay.dtb \
    overlays/spi-gpio35-39-overlay.dtb \
    overlays/tinylcd35-overlay.dtb \
    overlays/uart1-overlay.dtb \
    overlays/vc4-kms-v3d-overlay.dtb \
    overlays/vga666-overlay.dtb \
    overlays/w1-gpio-overlay.dtb \
    overlays/w1-gpio-pullup-overlay.dtb \
    overlays/wittypi-overlay.dtb \
"
