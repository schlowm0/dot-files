#!/bin/sh
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get upgrade
# install relevant programs
sudo apt-get install -y terminator inkscape htop ipython3 vlc vim chromium-browser \
    texlive-latex-extra latexmk texlive-bibtex-extra texlive git subversion zathura \
    numix-icon-theme numix-icon-theme-circle openvpn xclip build-essential  \
    lemonbar i3 i3lock i3lock-fancy

# Maybe change i3 to i3-gaps-wm from
# sudo add-apt-repository ppa:kgilmer/speed-ricer

# cd ~/Repositories/
# git clone git clone https://github.com/meskarune/i3lock-fancy.git
# cd i3lock-fancy
# sudo make install

cd ~/Repositories/
git clone https://github.com/i3-gnome/i3-gnome.git
cd i3-gnome/
sudo make install

# install emacs
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt-get update
sudo apt-get build-dep emacs24
cd ~/Downloads/
wget http://ftp.gnu.org/gnu/emacs/emacs-25.3.tar.gz
tar -xvf emacs-25.3.tar.gz
./configure
make
sudo make install

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cd ~/.emacs.d
git checkout develop
cp ~/Repositories/dot-files/.spacemacs ~/

# create installation dir
sudo mkdir -p /opt/franz

#install franz
wget -qO- https://github.com/meetfranz/franz/releases/download/v5.3.2/franz-5.3.2.tar.gz | sudo tar xvz -C /opt/franz/

# add app icon
sudo wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O /opt/franz/franz-icon.png

# configure app for desktop use
sudo bash -c "cat <<EOF > /usr/share/applications/franz.desktop
[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz
Icon=/opt/franz/franz-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet
EOF"

cp ~/Repositories/dot-files/.bash_aliases ~/
cp -r ~/Repositories/dot-files/.config ~/
cp -r ~/Repositories/dot-files/.ipython ~/
cp ~/Repositories/dot-files/.vimrc ~/
source ~/.bashrc

# install libraries and codecs
sudo apt-get install -y libusb-dev libopencv-dev mesa-utils mesa-common-dev \
    freeglut3-dev pkg-config build-essential cmake libatlas-base-dev --no-install-recommends \
    libboost-all-dev libgflags-dev libgoogle-glog-dev liblmdb-dev libprotobuf-dev libleveldb-dev \
    libsnappy-dev libhdf5-serial-dev protobuf-compiler g++


# install python related libraries via apt-get
# install miniconda and create python3.7 env
cd ~/tmp/
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda-latest-Linux-x86_64.sh
./Miniconda-latest-Linux-x86_64.sh

conda create -n teili python=3.5
conda create -n py-late python=3.7.1

# Install libcaer
git clone https://github.com/inilabs/libcaer.git
cd ~/Repositories/libcaer
sudo apt-get install build-essential cmake pkg-config libusb-1.0-0-dev libserial-dev
cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_OPENCV=1 .
make -j4
sudo make install

# Get desktop background wallpaper
cd ~/Pictures/
mkdir Wallpapers/
wget -O tree.png https://newevolutiondesigns.com/images/freebies/nature-hd-background-4.jpg
wget -O heart.jpg https://www.dropbox.com/s/iui4icdko8lufc3/heart.jpg?dl=1
wget -O triangle.jpg https://www.dropbox.com/s/o5b96rd8xyratei/art-digital-miscellaneous-modern-abstract-minimalist-wallpaper-hipster-triangle-wallpapers-images.jpg?dl=1
wget -O forest.jpg https://www.dropbox.com/s/kix5aok6ywymeid/HD_Nature_Wallpapers_by_CurtiXs.jpg?dl=1
