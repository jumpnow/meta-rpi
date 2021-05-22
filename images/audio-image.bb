SUMMARY = "A small console image that runs pianobar"
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

EXTRA_TOOLS = " \
    bzip2 \
    coreutils \
    diffutils \
    dosfstools \
    findutils \
    grep \
    i2c-tools \
    ifupdown \
    iproute2 \
    less \
    ntp ntp-tickadj \
    procps \
    sysfsutils \
    util-linux \
    util-linux-blkid \
    unzip \
    zip \
"

SYSTEMD_STUFF = " \
    systemd-analyze \
    systemd-bash-completion \
"

ALSA += " \
    libasound \
    libavcodec \
    libavdevice \
    libavfilter \
    libavformat \
    libavutil \
    libpostproc \
    libswresample \
    libswscale \
    alsa-conf \
    alsa-state \
    alsa-utils \
    alsa-utils-scripts \
"

IMAGE_INSTALL += " \
    ${CORE_OS} \
    ${KERNEL_EXTRA} \
    ${EXTRA_TOOLS} \
    ${SYTEMD_STUFF} \
    ${ALSA} \
    iqaudio-enable \
    pianobar \
"

export IMAGE_BASENAME = "audio-image"
