#!/bin/bash
#====================================#
#                                    #
#    OpenShift CodeReady Container   #
#                                    #
#====================================#

yum install -y epel-release
yum update -y
yum install -y libvirt-*
read - p "Type Processor (amd/intel) :" proc
sed -i "s/rhgb quiet/rhgb quiet mem_encrypt=on kvm_${proc}.sev=1/" /etc/default/grub
touch /etc/modprobe.d/sev.conf
echo "options kvm_${proc} sev=1" >> /etc/modprobe.d/sev.conf
reboot