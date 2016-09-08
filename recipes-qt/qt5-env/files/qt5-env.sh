#!/bin/sh

export PATH=${PATH}:/usr/bin/qt5

# the other option is linuxfb if just using qt widgets
export QT_QPA_PLATFORM=eglfs

# for the official Pi 7" touchscreen, the units are mm
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=155
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=86

# for the pitft35r 480x320 touchscreen
#export QT_QPA_EGLFS_WIDTH=480
#export QT_QPA_EGLFS_HEIGHT=320
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=85
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=50
#export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touchscreen0:rotate=90

# for the pitft28r 320x240 touchscreen
# not sure about the phys width value
#export QT_QPA_EGLFS_WIDTH=320
#export QT_QPA_EGLFS_HEIGHT=240
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=71
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=50
#export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touchscreen0:rotate=90
