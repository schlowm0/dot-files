#!/bin/sh
sudo apt-add-repository ppa:numix/ppa
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt-get update
sudo apt-get upgrade
# install relevant programs
sudo apt-get install -y terminator inkscape htop ipython3 vlc vim thunderbird chromium-browser \
    texlive-latex-extra latexmk texlive-bibtex-extra texlive texmaker git subversion zathura \
    numix-icon-theme numix-icon-theme-circle openvpn sublime-text xclip
# create installation dir
sudo mkdir -p /opt/franz

#install franz
wget -qO- https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz | sudo tar xvz -C /opt/franz/

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

cp /Repositories/dot-files/.bash_aliases ~/
cp -r /Repositories/dot-files/.config ~/
cp -r /media/schlowmo/Ellesmera/BackUp/.thunderbird ~/

source ~/.bashrc
# install python related libraries via apt-get
sudo apt-get install -y python3-pip python3-setuptools python3-matplotlib cython\
    python3-yaml python3-serial ant python3-opencv python3-opengl

# install libraries and codecs
sudo apt-get install -y libusb-dev libopencv-dev mesa-utils mesa-common-dev \
    freeglut3-dev pkg-config build-essential cmake libatlas-base-dev --no-install-recommends \
    libboost-all-dev libgflags-dev libgoogle-glog-dev liblmdb-dev libprotobuf-dev libleveldb-dev \
    libsnappy-dev libhdf5-serial-dev protobuf-compiler g++

# install python related packages via pip
pip3 install easydict brian2 pyqt5 pyqtgraph numpy scipy seaborn sparse h5py

# install nvidia drivers
sudo apt-get install nvidia-384-dev

# install opencv
# sudo apt-get install build-essential cmake pkg-config libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran python2.7-dev python3.5-dev
# cd ~ && wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.3.0.zip
# unzip opencv.zip
# wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.3.0.zip
# unzip opencv_contrib.zip
# cd ~/opencv-3.3.0/
# mkdir build && cd build
# cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules -D BUILD_EXAMPLES=ON ..
# make -j4
# sudo make install
# sudo ldconfig

# Install libcaer
cd ~/Repositories/libcaer
sudo apt-get install build-essential cmake pkg-config libusb-1.0-0-dev libserial-dev
cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_OPENCV=1 .
make -j4
sudo make install



