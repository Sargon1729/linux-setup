apt install $(cat packages.txt) -y

#Other packages that cannot be installed with APT############################################

#DOPS for better docker ps
wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-amd64-static" -O "/usr/local/bin/dops" && chmod +x "/usr/local/bin/dops"


#Mount volumes################################################################################
#. main.sh