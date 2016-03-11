#!/bin/bash

yum -y install dkms
yum -y install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel

mount /dev/cdrom /mnt
cd /mnt
./VBoxLinuxAdditions.run
yum clean all
