#!/usr/bin/env bash
#Variables
source ./config.sh
source ./logging.sh

############################################################################################ General Setup

mkdir "/home/$non_root_user/source"
mkdir -p "/home/$non_root_user/infra/docker"
if git clone https://github.com/Sargon1729/imports.git "/home/$non_root_user/imports"; then
    write_log "Cloning dotfiles git repo was successful"
else
    write_error "Issue encountered when cloning dot files"
fi

chown -R $non_root_user "/home/$non_root_user/dotfiles/"
chgrp -R $non_root_user "/home/$non_root_user/dotfiles/"

############################################################################################

install-packages () {
    if bash install-packages.sh; then
        write_log "Installing DOPS was successful"
    else
        write_error "Issue encountered when installing DOPS"
    fi
}

install-dops () {
    if bash dops.sh; then
        write_log "Installing DOPS was successful"
    else
        write_error "Issue encountered when installing DOPS"
    fi
}


install-docker(){
    if bash docker.sh; then
        write_log "Installing Docker was successful"
    else
        write_error "Issue encountered when installing Docker"
    fi
}

setup-ssh-certs (){
    if bash ssh.sh; then
        write_log "Configured trusted root SSH key"
    else
        write_error "Issue encountered when configuring trusted root SSH key"
    fi
}

install-packages
install-dops
install-docker
setup-ssh-certs