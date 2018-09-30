#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
# Use graphical install
text
# Run the Setup Agent on first boot
firstboot --enable
# Keyboard layouts
keyboard --vckeymap=jp --xlayouts='jp'
# System language
lang ja_JP.UTF-8

# Network information
network --bootproto=static --device=eth0 --gateway=192.168.11.1 --ip=192.168.11.200 --nameserver=192.168.11.1 --netmask=255.255.255.0 --ipv6=auto --activate
network --hostname=localhost.localdomain

# Root password
rootpw --plaintext Passw0rd
# System services
services --enabled="chronyd"
# System timezone
timezone Asia/Tokyo --isUtc
reboot
# System bootloader configuration
bootloader --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel

%packages
@^minimal
@core
chrony

%end

%addon com_redhat_kdump --disable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy luks --minlen=6 --minquality=50 --notstrict --nochanges --notempty
%end