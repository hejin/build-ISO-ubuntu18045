#!/bin/bash

#echo $#
if [ $# != 1 ]; then
	echo 'Usage: $0 CDROM_PATH'
	exit 1
fi

echo 'check if target directory is legal ...'
CDROM_PATH=$1
if [ ! -d $CDROM_PATH ]; then
	echo 'ERROR: $CDROM_PATH is not a path!'
	exit 1
fi

if [ ! -d $CDROM_PATH/ubuntuiso ]; then
	echo "ERROR: $CDROM_PATH doesn't contain the unpacked ISO!"
	exit 1
elif [ ! -d $CDROM_PATH/ubuntuiso/preseed ]; then
	echo "ERROR: $CDROM_PATH doesn't contain the unpacked ISO!"
	exit 1
elif [ ! -d $CDROM_PATH/ubuntuiso/boot/grub ]; then
	echo "ERROR: $CDROM_PATH doesn't contain the unpacked ISO!"
	exit 1
elif [ ! -d $CDROM_PATH/ubuntuiso/isolinux ]; then
	echo "ERROR: $CDROM_PATH doesn't contain the unpacked ISO!"
	exit 1
fi 

id=`id -u`
#echo $id
if [ $id != '0' ]; then
	echo 'ERROR: must run with root previleage!'
	exit 1
fi

# copy files
echo 'copy files ... '
#CMD=diff
CMD=cp
CMD_OPTS=' -f '
$CMD $CMD_OPTS build.sh 		 $CDROM_PATH/build.sh
$CMD $CMD_OPTS auto-inst.seed    $CDROM_PATH/ubuntuiso/preseed/auto-inst.seed
$CMD $CMD_OPTS grub.cfg 		 $CDROM_PATH/ubuntuiso/boot/grub/grub.cfg
$CMD $CMD_OPTS txt.cfg           $CDROM_PATH/ubuntuiso/isolinux/txt.cfg
$CMD $CMD_OPTS isolinux.cfg 	 $CDROM_PATH/ubuntuiso/isolinux/isolinux.cfg
$CMD -rf       post-install      $CDROM_PATH/
echo 'done.'
