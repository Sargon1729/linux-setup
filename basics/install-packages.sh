apt update
if apt install $(cat basic_packages.txt | egrep -v '#') -y; then
    write_log "Installing packages was successful"
else
    write_error "Issue encountered when installing packages"
fi