#!/bin/bash

cd ../../linux/arch/arm/boot/dts/overlays

ls -l *.dts | sed s:-overlay\.dts:\.dtbo: | awk '{ print "    overlays/"$9, "\\" }'

cd $OLDPWD
