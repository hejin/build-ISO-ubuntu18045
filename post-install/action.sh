#!/bin/bash
touch /post-install/done
###sh /post-install/setup.sh
#
/usr/sbin/useradd -m --shell /bin/bash -p $(/usr/bin/perl -e 'print crypt($ARGV[0], "password")' 'xxhh168') sample_user
touch /var/log/sample_service.log
chown sample_user:sample_user /var/log/sample_service.log
mkdir -p /var/run/sample_service
#
## copy files
POST_INSTALL_DIR=/post-install/sample_service
TARGET_DIR=/opt/sample_script
cp $POST_INSTALL_DIR/sample_service.service /etc/systemd/system/
mkdir -p $TARGET_DIR
cp $POST_INSTALL_DIR/systemd_example.sh $TARGET_DIR/
cp $POST_INSTALL_DIR/sample_service.sh  $TARGET_DIR/
chmod +x $POST_INSTALL_DIR/*.sh
#
##enable service
systemctl enable sample_service

systemctl enable lighttpd
