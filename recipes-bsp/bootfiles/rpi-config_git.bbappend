SRCREV = "648ffc470824c43eb0d16c485f4c24816b32cd6f"

do_deploy_append() {
    if [ -n "${KERNEL_IMAGETYPE}" ]; then
        echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "kernel=${KERNEL_IMAGETYPE}" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi
}
