SUMMARY = "A custom console development image customized for the rpi"
HOMEPAGE = "http://www.jumpnowtek.com"

inherit image

IMAGE_FEATURES += "package-management"
IMAGE_LINGUAS = "en-us"

DEPENDS += "rpi-bootfiles"

CORE_OS = "\
    openssh openssh-keygen openssh-sftp-server \
    packagegroup-core-boot \
    tzdata \
"

KERNEL_EXTRA = "\
    kernel-modules \
"

DEV_SDK = " \
    binutils \
    binutils-symlinks \
    coreutils \
    cpp \
    cpp-symlinks \
    diffutils \
    elfutils elfutils-binutils \
    file \
    gcc \
    gcc-symlinks \
    g++ \
    g++-symlinks \
    gdb \
    gettext \
    git \
    ldd \
    libstdc++ \
    libstdc++-dev \
    libtool \
    ltrace \
    make \
    perl-modules \
    pkgconfig \
    python3-modules \
    strace \
"

EXTRA_TOOLS = " \
    bzip2 \
    chrony \
    curl \
    dosfstools \
    e2fsprogs-mke2fs \
    ethtool \
    fbset \
    findutils \
    grep \
    i2c-tools \
    ifupdown \
    iperf3 \
    iproute2 \
    iptables \
    less \
    lsof \
    procps \
    sysfsutils \
    tcpdump \
    util-linux \
    util-linux-blkid \
    unzip \
    vim \
    wget \
    zip \
"

RPI_STUFF = " \
    userland \
"

SECURITY = " \
    checksec \
    firewall \
    nikto \
    nmap \
    python3-scapy \
"

SYSTEMD_STUFF = " \
    systemd-analyze \
    systemd-bash-completion \
"

WIFI = " \
    crda \
    iw \
    linux-firmware-rpidistro-bcm43430 \
    linux-firmware-rpidistro-bcm43455 \
    wpa-supplicant \
"

IMAGE_INSTALL += " \
    ${CORE_OS} \
    ${KERNEL_EXTRA} \
    ${DEV_SDK} \
    ${EXTRA_TOOLS} \
    ${RPI_STUFF} \
    ${SECURITY} \
    ${SYSTEMD_STUFF} \
    ${WIFI} \
"

set_local_timezone() {
    ln -sf /usr/share/zoneinfo/EST5EDT ${IMAGE_ROOTFS}/etc/localtime
    echo 'America/New_York' > ${IMAGE_ROOTFS}/etc/timezone
}

ROOTFS_POSTPROCESS_COMMAND += " \
    set_local_timezone ; \
"

export IMAGE_BASENAME = "console-image"
