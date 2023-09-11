sudo apt-get update
sudo apt-get install curl net-tools -y
sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token bonjour --node-ip=192.168.42.111" sh -s -
echo "alias k='kubectl'" >> /home/vagrant/.bashrc
echo "export PATH=$PATH:/sbin" >> /home/vagrant/.bashrc
