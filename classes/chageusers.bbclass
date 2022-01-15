# Used for image level changes to user password expiry information.
#
# Below is an example showing how to use this functionality.
# This will force a password change for root on first login.
#
# INHERIT += "chageusers"
# CHAGE_USERS_PARAMS = "chage -d0 root;"
#
# Other chage commands probably work, but this is the only one I tested.

PACKAGE_INSTALL:append = " ${@['', 'base-passwd shadow'][bool(d.getVar('CHAGE_USERS_PARAMS'))]}"

ROOTFS_POSTPROCESS_COMMAND:append = " chage_user;"

chage_user () {
	chage_user_settings="${CHAGE_USERS_PARAMS}"
	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"

	setting=$(echo $chage_user_settings | cut -d ';' -f1)
	remaining=$(echo $chage_user_settings | cut -d ';' -f2-)

	while [ -n "$setting" ]; do
		cmd=$(echo $setting | cut -d ' ' -f1)

		if [ "$cmd" = "chage" ]; then
			opts=$(echo $setting | cut -d ' ' -f2-)
			perform_chage "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
		else
			bbfatal "Invalid command in CHAGE_USERS_PARAMS: $cmd"
		fi

		# Avoid infinite loop if the last parameter doesn't end with ';'
		if [ "$setting" = "$remaining" ]; then
			break
		fi

		# iterate to the next setting
		setting=$(echo $remaining | cut -d ';' -f1)
		remaining=$(echo $remaining | cut -d ';' -f2-)
	done
}

perform_chage () {
	set +e
	local rootdir="$1"
	local opts="$2"
	bbnote "${PN}: Performing chage with [$opts]"
	local username=$(echo "$opts" | awk '{ print $NF }')
	grep -q "^$username:" $rootdir/etc/passwd

	if [ $? -eq 0 ]; then
		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO chage \$opts\" || true
		if [ $? -ne 0 ]; then
			bbfatal "${PN}: chage command did not succeed"
		fi
	else
		bbwarn "${PN}: user $username does not exist, unable to modify"
	fi
	set -e
}
