pkg_postinst_${PN}() {
    echo "pcm.front cards.pcm.default" >> $D/etc/asound.conf
}
