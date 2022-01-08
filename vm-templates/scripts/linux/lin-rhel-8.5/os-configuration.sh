## Setup MoTD
OS=$(head -n 1 /etc/photon-release)
BUILD=$(tail -n 1 /etc/photon-release | awk -F"=" '{print (NF>1)? $NF : ""}')
BUILDDATE=$(date +"%y%m")
RELEASE="$OS ($BUILD)"
sudo cat << ISSUE > /etc/issue
88888            8eeee8                            8   8                            8eeee8
  8  e   e eeee  8      eeeeeee eeeee e     e      8   8 e   e eeeeeee eeeee eeeee  8    " e     eeeee e   e eeeee
  8e 8   8 8     8eeeee 8  8  8 8   8 8     8      8eee8 8   8 8  8  8 8   8 8   8  8e     8     8  88 8   8 8   8
  88 8eee8 8eee      88 8e 8  8 8eee8 8e    8e     88  8 8e  8 8e 8  8 8eee8 8e  8  88     8e    8   8 8e  8 8e  8
  88 88  8 88    e   88 88 8  8 88  8 88    88     88  8 88  8 88 8  8 88  8 88  8  88   e 88    8   8 88  8 88  8
  88 88  8 88ee  8eee88 88 8  8 88  8 88eee 88eee  88  8 88ee8 88 8  8 88  8 88  8  88eee8 88eee 8eee8 88ee8 88ee8

        $RELEASE ($BUILDDATE)
ISSUE
sudo ln -sf /etc/issue /etc/issue.net