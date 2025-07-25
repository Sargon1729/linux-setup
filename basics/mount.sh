touch /mnt/.smbcredentials
chmod 600 /mnt/.smbcredentials
echo '//ajr1.sargon.local/smb /mnt/smb cifs credentials=/mnt/.smbcredentials,uid=1000,gid=1000,x-systemd.automount 0 0' >> /etc/fstab
chmod -R 666 /mnt/smb