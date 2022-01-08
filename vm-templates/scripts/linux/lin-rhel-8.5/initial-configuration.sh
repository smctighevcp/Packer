## Apply updates
echo ' - Applying package updates ...'
sudo yum update -y -q &>/dev/null

## Install core packages
echo ' - Installing additional packages ...'
sudo yum install -y -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm &>/dev/null
sudo yum install -y -q perl &>/dev/null

## Cleanup yum
echo ' - Clearing yum cache ...'
sudo yum clean all &>/dev/null

## Configure SSH server
echo ' - Configuring SSH server daemon ...'
sudo sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
sudo sed -i "s/.*PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
