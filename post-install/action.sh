#!/bin/bash
touch /post-install/done

# copy files
POST_INSTALL_DIR=/post-install/cockpit_helper
EXEC_DIR=/usr/local/bin/
## systemd service file
cp $POST_INSTALL_DIR/cockpit_helper.service /etc/systemd/system/

## execution 
mkdir -p $EXEC_DIR
cp $POST_INSTALL_DIR/cockpit_helper.sh $EXEC_DIR/
chmod a+x $EXEC_DIR/cockpit_helper.sh

#enable service
systemctl enable cockpit_helper.service
