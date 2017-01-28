LINUX_VERSION = "4.4.45"

SRCREV = "25aa8634418934f094e13ac75c902416194d1dbd"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-raspberrypi-4.4:"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;protocol=git;branch=rpi-4.4.y \
    file://0001-dts-Add-pwm-overlays-with-clock-enabled.patch \
    file://0002-Add-ads1015-driver-to-config.patch \
    file://defconfig \
"

PR = "r50"

KERNEL_DEVICETREE = " \
    bcm2708-rpi-b.dtb \
    bcm2708-rpi-b-plus.dtb \
    bcm2708-rpi-cm.dtb \
    bcm2709-rpi-2-b.dtb \
    bcm2710-rpi-3-b.dtb \
    bcm2710-rpi-cm3.dtb \
    \
    overlays/adau1977-adc-overlay.dtb \
    overlays/ads1015-overlay.dtb \
    overlays/ads7846-overlay.dtb \
    overlays/akkordion-iqdacplus-overlay.dtb \
    overlays/allo-piano-dac-pcm512x-audio-overlay.dtb \
    overlays/at86rf233-overlay.dtb \
    overlays/audioinjector-wm8731-audio-overlay.dtb \
    overlays/audremap-overlay.dtb \
    overlays/bmp085_i2c-sensor-overlay.dtb \
    overlays/dht11-overlay.dtb \
    overlays/dionaudio-loco-overlay.dtb \
    overlays/dpi18-overlay.dtb \
    overlays/dpi24-overlay.dtb \
    overlays/dwc2-overlay.dtb \
    overlays/dwc-otg-overlay.dtb \
    overlays/enc28j60-overlay.dtb \
    overlays/enc28j60-spi2-overlay.dtb \
    overlays/gpio-ir-overlay.dtb \
    overlays/gpio-poweroff-overlay.dtb \
    overlays/hifiberry-amp-overlay.dtb \
    overlays/hifiberry-dac-overlay.dtb \
    overlays/hifiberry-dacplus-overlay.dtb \
    overlays/hifiberry-digi-overlay.dtb \
    overlays/hifiberry-digi-pro-overlay.dtb \
    overlays/hy28a-overlay.dtb \
    overlays/hy28b-overlay.dtb \
    overlays/i2c0-bcm2708-overlay.dtb \
    overlays/i2c1-bcm2708-overlay.dtb \
    overlays/i2c-gpio-overlay.dtb \
    overlays/i2c-mux-overlay.dtb \
    overlays/i2c-pwm-pca9685a-overlay.dtb \
    overlays/i2c-rtc-overlay.dtb \
    overlays/i2c-sensor-overlay.dtb \
    overlays/i2s-gpio28-31-overlay.dtb \
    overlays/i2s-mmap-overlay.dtb \
    overlays/iqaudio-dac-overlay.dtb \
    overlays/iqaudio-dacplus-overlay.dtb \
    overlays/iqaudio-digi-wm8804-audio-overlay.dtb \
    overlays/justboom-dac-overlay.dtb \
    overlays/justboom-digi-overlay.dtb \
    overlays/lirc-rpi-overlay.dtb \
    overlays/mcp23017-overlay.dtb \
    overlays/mcp23s17-overlay.dtb \
    overlays/mcp2515-can0-overlay.dtb \
    overlays/mcp2515-can1-overlay.dtb \
    overlays/mcp3008-overlay.dtb \
    overlays/mmc-overlay.dtb \
    overlays/mz61581-overlay.dtb \
    overlays/pi3-act-led-overlay.dtb \
    overlays/pi3-disable-bt-overlay.dtb \
    overlays/pi3-disable-wifi-overlay.dtb \
    overlays/pi3-miniuart-bt-overlay.dtb \
    overlays/piscreen2r-overlay.dtb \
    overlays/piscreen-overlay.dtb \
    overlays/pisound-overlay.dtb \
    overlays/pitft22-overlay.dtb \
    overlays/pitft28-capacitive-overlay.dtb \
    overlays/pitft28-resistive-overlay.dtb \
    overlays/pitft35-resistive-overlay.dtb \
    overlays/pps-gpio-overlay.dtb \
    overlays/pwm-2chan-overlay.dtb \
    overlays/pwm-2chan-with-clk-overlay.dtb \
    overlays/pwm-overlay.dtb \
    overlays/pwm-with-clk-overlay.dtb \
    overlays/qca7000-overlay.dtb \
    overlays/raspidac3-overlay.dtb \
    overlays/rpi-backlight-overlay.dtb \
    overlays/rpi-dac-overlay.dtb \
    overlays/rpi-display-overlay.dtb \
    overlays/rpi-ft5406-overlay.dtb \
    overlays/rpi-proto-overlay.dtb \
    overlays/rpi-sense-overlay.dtb \
    overlays/rra-digidac1-wm8741-audio-overlay.dtb \
    overlays/sc16is750-i2c-overlay.dtb \
    overlays/sc16is752-spi1-overlay.dtb \
    overlays/sdhost-overlay.dtb \
    overlays/sdio-1bit-overlay.dtb \
    overlays/sdio-overlay.dtb \
    overlays/sdtweak-overlay.dtb \
    overlays/smi-dev-overlay.dtb \
    overlays/smi-nand-overlay.dtb \
    overlays/smi-overlay.dtb \
    overlays/spi0-cs-overlay.dtb \
    overlays/spi0-hw-cs-overlay.dtb \
    overlays/spi1-1cs-overlay.dtb \
    overlays/spi1-2cs-overlay.dtb \
    overlays/spi1-3cs-overlay.dtb \
    overlays/spi2-1cs-overlay.dtb \
    overlays/spi2-2cs-overlay.dtb \
    overlays/spi2-3cs-overlay.dtb \
    overlays/spi-gpio35-39-overlay.dtb \
    overlays/spi-rtc-overlay.dtb \
    overlays/tinylcd35-overlay.dtb \
    overlays/uart1-overlay.dtb \
    overlays/vc4-fkms-v3d-overlay.dtb \
    overlays/vc4-kms-v3d-overlay.dtb \
    overlays/vga666-overlay.dtb \
    overlays/w1-gpio-overlay.dtb \
    overlays/w1-gpio-pullup-overlay.dtb \
    overlays/wittypi-overlay.dtb \
"
