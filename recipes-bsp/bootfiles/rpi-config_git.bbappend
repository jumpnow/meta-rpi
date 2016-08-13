SRCREV = "648ffc470824c43eb0d16c485f4c24816b32cd6f"

do_deploy_append() {
    if [ -n "${ENABLE_RPI3_SERIAL_CONSOLE}" ]; then
        echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "## Disable RPi3 bluetooth to enable serial console on UART0" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "dtoverlay=pi3-disable-bt" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi
}
