apt install $(cat packages.txt) -y

#Other packages that cannot be installed with APT############################################

#DOPS for better docker ps
wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-amd64-static" -O "/usr/local/bin/dops" && chmod +x "/usr/local/bin/dops"


#Mount volumes################################################################################
touch /mnt/.smbcredentials
chmod 600 /mnt/.smbcredentials
echo '//ajr1.sargon.local/smb /mnt/smb cifs credentials=/mnt/.smbcredentials,uid=1000,gid=1000,x-systemd.automount 0 0' >> /etc/fstab
chmod -R 666 /mnt/smb