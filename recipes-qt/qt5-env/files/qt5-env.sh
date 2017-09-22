#!/bin/sh

export PATH=${PATH}:/usr/bin/qt5

# the other option is linuxfb if just using qt widgets
export QT_QPA_PLATFORM=eglfs

# physical width and height units are mm

# for the official Pi 7" touchscreen
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=155
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=86

# for the pitft35r 480x320 touchscreen
#export QT_QPA_EGLFS_WIDTH=480
#export QT_QPA_EGLFS_HEIGHT=320
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=85
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=50
# set a rotate value appropriate with the one used in the overlay 
#export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touchscreen0:rotate=90

# for the pitft28r 320x240 touchscreen
#export QT_QPA_EGLFS_WIDTH=320
#export QT_QPA_EGLFS_HEIGHT=240
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=78
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=50
# set a rotate value appropriate with the one used in the overlay 
#export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touchscreen0:rotate=90

if [ -z "${XDG_RUNTIME_DIR}" ]; then
    export XDG_RUNTIME_DIR=/tmp/user/${UID}

    if [ ! -d ${XDG_RUNTIME_DIR} ]; then
        mkdir -p ${XDG_RUNTIME_DIR}
    fi
fi
