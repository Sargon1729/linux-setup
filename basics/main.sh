#!/usr/bin/env bash
#Variables
source ./config.sh
source ./logging.sh

############################################################################################ General Setup

mkdir "$non_root_user_path/source"
mkdir -p "$non_root_user_path/infra/docker"
if git clone https://github.com/Sargon1729/dotfiles.git "$non_root_user_path/dotfiles"; then
    write_log "Cloning dotfiles git repo was successful"
else
    write_error "Issue encountered when cloning dot files"
fi

############################################################################################ Install from basic_packages.txt

apt update
if apt install $(cat basic_packages.txt | egrep -v '#|-') -y; then
    write_log "Installing packages was successful"
else
    write_error "Issue encountered when installing packages"
fi

############################################################################################ Other packages that cannot be installed with APT

if wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-amd64-static" -O "/usr/local/bin/dops" && chmod +x "/usr/local/bin/dops"; then
    write_log "Installing DOPS was successful"
else
    write_error "Issue encountered when installing DOPS"
fi

##################################################################

if bash docker.sh; then
    write_log "Installing Docker was successful"
else
    write_error "Issue encountered when installing Docker"
fi

##################################################################

if bash sudo_timeout.sh; then
    write_log "Configuring custom sudo timeout was successful"
else
    write_error "Issue encountered when Configuring custom sudo timeout"
fi

##################################################################

if bash powershell.sh; then
    write_log "Installing Powershell was successful"
else
    write_error "Issue encountered when installing powershell"
fi

############################################################################################ SSH Keys

if [ -d "$non_root_user_path/.ssh" ]; then
    cp ./authorized_keys "$non_root_user_path/.ssh/"
else
    mkdir $non_root_user_path/.ssh
    cp ./authorized_keys "$non_root_user_path/.ssh/"
fi

write_log "Installed SSH key"

############################################################################################ Disable Processes
sudo systemctl stop $(cat disable_services.txt)
sudo systemctl disable $(cat disable_services.txt)