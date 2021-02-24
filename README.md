# build-ISO-ubuntu18045-with-cubic
build a customized ubuntu 18.04.5 server ISO with cubic wizard or mkisofs.

## 1. preparation

* install ubuntu 18.04.5 desktop in a box (virtual machine also OK)
* login the ubuntu box, and make sure mkisofs exists. If not, install the genisoimage package.
* NOTE: the following steps are in this ubuntu box
* download the legacy ubuntu 18.04.5 server ISO from the official site 
  * http://cdimage.ubuntu.com/ubuntu/releases/18.04.5/release/ubuntu-18.04.5-server-amd64.iso
  * NOTE: don't use the live-server ISO!

## 2. build

* mount the ISO file with loop device, create a new working directory under your HOME, and copy all the files from the ISO directory to the working directory (WORKDIR in short)
  * NOTE: please use the options '-rT' to copy CDROM content to the working directory
* run the prep.sh scripts of current project, with the parameter of the absolute path of WORKDIR
* enter the WORKDIR, run 'sh build.sh' with sudo
* a new ISO file named autoinstall.iso will be in WORKDIR

## 3. check if works

* create a virtual machine with the boot ISO of the autoinstall.iso, or
* burn the ISO file to a USB stick or CDROM
* power on the virtual machine or a physical box which will boot from the ISO image
* see if it can finish the unattended installation successfully
