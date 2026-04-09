cp ./root_key.pub /etc/ssh
echo "TrustedUserCAKeys /etc/ssh/root_key.pub" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
systemctl restart sshd

