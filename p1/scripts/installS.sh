sudo apt-get update
sudo apt-get install curl net-tools -y
sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --flannel-iface 'eth1' --token bonjour" sh -s -
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
echo "alias k='kubectl'" >> /home/vagrant/.bashrc
echo "export PATH=$PATH:/sbin" >> /home/vagrant/.bashrc
