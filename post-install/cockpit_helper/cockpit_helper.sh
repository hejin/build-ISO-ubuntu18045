#!/bin/bash

# Simple helper to check if cockpit service already runs or else enable it
# with systemd.

# By o5@softx
# Licensed under GPL V2
#

echo "###############################"
echo "####### Cockpit Helper   ######"
echo "###############################"

rc="`systemctl list-unit-files --state=enabled |grep -w cockpit.socket`"
echo $rc

if [ -z "$rc" ]; then
	echo "WARN: cockpit is not enabled!"
	systemctl enable cockpit --now cockpit.socket
else
        echo "INFO: cockpit has been already enabled."
fi
