echo " --- Executing initial-configuration.sh ..."

## Apply updates
echo " --- Updating the guest operating system ..."
sudo tdnf upgrade tdnf -y --refresh 2>&-
sudo tdnf distro-sync -y 2>&-
echo " --- Updates installed! ..."

## Configure SSH server
echo " --- Configuring SSH server daemon ..."
sudo sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
sudo sed -i "s/.*PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
echo " --- SSH server daemon Configured! ..."

echo " --- initial-configuration.sh finished! ..."


