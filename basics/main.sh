#Variables
export non_root_user_path='/home/admin1'

############################################################################################ General Setup

mkdir "$non_root_user_path/source"
mkdir -p "$non_root_user_path/infra/docker"
git clone https://github.com/Sargon1729/dotfiles.git "$non_root_user_path/dotfiles"

############################################################################################ Install from basic_packages.txt

sudo apt install $(cat basic_packages.txt) -y

############################################################################################ Other packages that cannot be installed with APT

sudo wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-amd64-static" -O "/usr/local/bin/dops" && chmod +x "/usr/local/bin/dops"

sudo bash docker.sh

sudo bash ovpn3.sh

sudo bash sudo_timeout.sh

sudo bash powershell.sh

############################################################################################ Mount volumes
#. mount.sh

############################################################################################ Disable Processes
sudo systemctl stop $(cat disable_services.txt)
sudo systemctl disable $(cat disable_services.txt)