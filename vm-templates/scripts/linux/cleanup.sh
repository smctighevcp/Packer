echo " --- Executing cleanup.sh ..."

## Final cleanup actions
echo " --- Executing final cleanup tasks ..."
sudo echo -n > /etc/machine-id
sudo systemctl start iptables
echo " --- Cleanup complete! ..."

echo " --- cleanup.sh finished! ..."