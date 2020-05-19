PACKAGE_ARCH = "${MACHINE_ARCH}"
ARM_INSTRUCTION_SET_armv7a = "arm"
ARM_INSTRUCTION_SET_armv7r = "arm"
ARM_INSTRUCTION_SET_armv7ve = "arm"

PRIVATE_LIBS += "\
    libavcodec.so.58 \
    libavformat.so.58 \
    libavutil.so.56 \
    libswresample.so.3 \
    libswscale.so.5 \
"
