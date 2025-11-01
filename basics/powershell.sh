###################################
# Prerequisites

# Update package lists
sudo apt-get update

# Install dependencies
sudo apt-get install jq libssl1.1 libunwind8 -y

###################################
# Download and extract PowerShell

# Grab the latest tar.gz
bits=$(getconf LONG_BIT)
release=$(curl -sL https://api.github.com/repos/PowerShell/PowerShell/releases/latest)
package=$(echo $release | jq -r ".assets[].browser_download_url" | grep "linux-arm${bits}.tar.gz")
wget $package

# Make folder to put powershell
mkdir /opt/powershell

# Unpack the tar.gz file
tar -xvf "./${package##*/}" -C /opt/powershell


ln -s /opt/powershell/pwsh /usr/bin/pwsh