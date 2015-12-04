SUMMARY = "A basic X11 image"
HOMEPAGE = "http://www.jumpnowtek.com"
LICENSE = "MIT"

require console-image.bb

X11_PACKAGES = " \
    x11-common \
    xauth \
    xcursor-transparent-theme \
    xf86-input-evdev \
    xf86-input-keyboard \
    xf86-input-mouse \
    xf86-video-fbdev \
    xhost \
    xinit \
    xinput \
    xinput-calibrator \
    xkbcomp \
    xkeyboard-config \
    xkeyboard-config-locale-en-gb \
    xmodmap \
    xrandr \
    xserver-nodm-init \
    xserver-xf86-config \
    xserver-xorg \
    xset \
    xtscal \
 "

MATCHBOX_PACKAGES = " \
    matchbox-config-gtk \
    matchbox-desktop \
    matchbox-keyboard \
    matchbox-keyboard-applet \
    matchbox-panel-2 \
    matchbox-session \
    matchbox-terminal \
    matchbox-theme-sato \
    matchbox-wm \
    sato-icon-theme \
    settings-daemon \
 "

SATO_PACKAGES = " \
    gtk-sato-engine \
    gtk-theme-sato \
    matchbox-desktop-sato \
    matchbox-session-sato \
    matchbox-theme-sato \
    sato-icon-theme \
    sato-screenshot \
 "

ALSA += " \
    alsa-dev \
    alsa-lib \
    alsa-utils \
    alsa-utils-scripts \
 "

X11_EXTRAS = " \
    disable-x11-blanking \
    formfactor \
    pcmanfm \
    pcmanfm-locale-en-gb \
    shutdown-desktop \
    x11vnc \
 "

IMAGE_INSTALL += " \
    ${MATCHBOX_PACKAGES} \
    ${SATO_PACKAGES} \
    ${X11_EXTRAS} \
    ${X11_PACKAGES} \
 "

export IMAGE_BASENAME = "x11-image"

