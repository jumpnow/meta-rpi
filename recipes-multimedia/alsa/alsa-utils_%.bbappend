pkg_postinst:${PN}() {
    echo "pcm.front cards.pcm.default" >> $D/etc/asound.conf
}
