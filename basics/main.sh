#Variables
export non_root_user_path='/home/admin1'

############################################################################################ General Setup
cd $non_root_user_path

mkdir "source"
mkdir -p "infra/docker"
git clone https://github.com/Sargon1729/dotfiles.git

############################################################################################ Install from basic_packages.txt

sudo apt install $(cat basic_packages.txt) -y

############################################################################################ Other packages that cannot be installed with APT

sudo wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-amd64-static" -O "/usr/local/bin/dops" && chmod +x "/usr/local/bin/dops"

sudo bash ./docker.sh

sudo bash ./ovpn3.sh

############################################################################################ Mount volumes
#. mount.sh
