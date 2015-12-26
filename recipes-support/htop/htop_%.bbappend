pkg_postinst_${PN} () {
	[ -f /usr/share/applications/htop.desktop ] && rm /usr/share/applications/htop.desktop
}
