#!/bin/bash
WORK_DIR=$PWD

mkisofs -D -r -V "Attendless_Ubuntu" \
	-cache-inodes -J -l -b isolinux/isolinux.bin \
	-c isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
	-boot-info-table -o $WORK_DIR/autoinstall.iso $WORK_DIR/ubuntuiso
