#!/bin/bash

cd ../../linux/arch/arm/boot/dts/overlays

ls -l *.dts | sed s:dts:dtb: | awk '{ print "    overlays/"$9, "\\" }'

cd $OLDPWD
