#!/bin/sh
ssh-keygen -t rsa -b 4096 -C "mmilde@ini.uzh.ch"
cat ~/.ssh/id_rsa.pub | cop
read -p "SSH PUB ID has been copied to clip board. Please add it to Github and Gitlab and then press [Enter] key to continue..."
# Set up standard repositories
mkdir ~/Repositories
sudo chown -R schlowmo:schlowmo Repositories
cd ~/Repositories
git config --global user.name "Moritz Milde"
git config --global user.email "mmilde@ini.uzh.ch"
# git clone git@github.com:SensorsINI/jaer.git
# cd jaer && ant jar
cd /etc/udev/rules.d/
sudo wget https://github.com/inilabs/devices-bin/blob/master/drivers/linux/udev-rules/65-inilabs.rules
cd ~/Repositories
git clone git@code.ini.uzh.ch:ncs/teili.git
git clone git@code.ini.uzh.ch:mmilde/OCTA.git

source activate teili
cd ~/Repositories/
pip install teili/
pip install OCTA/

