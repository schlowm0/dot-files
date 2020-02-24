#!/bin/sh
sudo apt-add-repository ppa:numix/ppa
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt-get upgrade
# install relevant programs
sudo apt-get install -y terminator inkscape htop ipython3 vlc vim chromium-browser \
    texlive-latex-extra latexmk texlive-bibtex-extra texlive git subversion zathura \
    numix-icon-theme numix-icon-theme-circle openvpn xclip build-essential \
    lemonbar i3 i3lock i3lock-fancy i3-gaps lm-sensors zsh arc-theme fonts-font-awesome \
    rofi-dev feh gnome-tweak-tool lxappearance thunar

# install libraries and codecs
sudo apt-get install -y libusb-dev libopencv-dev mesa-utils mesa-common-dev \
    freeglut3-dev pkg-config build-essential cmake libatlas-base-dev --no-install-recommends \
    libboost-all-dev libgflags-dev libgoogle-glog-dev liblmdb-dev libprotobuf-dev libleveldb-dev \
    libsnappy-dev libhdf5-serial-dev protobuf-compiler g++ libgtk-3-dev libgif-dev \
    libxpm-dev libtinfo-dev fonts-powerline curl

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/Repositories/
git clone https://github.com/i3-gnome/i3-gnome.git
cd i3-gnome/
sudo make install

git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
cd .solarized/
./install.sh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd /tmp	
git clone https://github.com/ryanoasis/nerd-fonts.git
./nerds-fonts/install.sh

git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
sudo make install

# install emacs
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cd ~/.emacs.d
git checkout develop
cp ~/Repositories/dot-files/.spacemacs ~/

curl https://gist.githubusercontent.com/lucasdavila/3875946/raw/1c100cae16a06bef154af0f290d665405b554b3b/install_source_code_pro.sh | sh

# create installation dir
sudo mkdir -p /opt/franz

#install franz
wget -qO- https://github.com/meetfranz/franz/releases/download/v5.3.2/franz-5.3.2.tar.gz | sudo tar xvz -C /opt/franz/
sudo mv franz-5.3.2/ Franz

# add app icon
sudo wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O /opt/franz/franz-icon.png

# configure app for desktop use
sudo bash -c "cat <<EOF > /usr/share/applications/franz.desktop
[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz/franz
Icon=/opt/franz/franz-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet
EOF"

cp ~/Repositories/dot-files/.bash_aliases ~/
cp -r ~/Repositories/dot-files/.config ~/
cp -r ~/Repositories/dot-files/.ipython ~/
cp ~/Repositories/dot-files/.vimrc ~/
cp ~/Repositories/dot-files/.zshrc ~/
source ~/.bashrc

# install python related libraries via apt-get
# install miniconda and create python3.7 env
cd /tmp
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda-latest-Linux-x86_64.sh
./Miniconda-latest-Linux-x86_64.sh

conda create -n teili python=3.5
conda create -n 3.7 python=3.7.1

# Install libcaer
# cd ~/Repositories
# git clone https://github.com/inilabs/libcaer.git
# cd ~/Repositories/libcaer
# sudo apt-get install build-essential cmake pkg-config libusb-1.0-0-dev libserial-dev
# cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_OPENCV=1 .
# make -j4
# sudo make install

# Get desktop background wallpaper
cd ~/Pictures/
mkdir Wallpapers/
cd Wallpapers/
wget -O tree.png https://newevolutiondesigns.com/images/freebies/nature-hd-background-4.jpg
wget -O heart.jpg https://www.dropbox.com/s/iui4icdko8lufc3/heart.jpg?dl=1
wget -O triangle.jpg https://www.dropbox.com/s/o5b96rd8xyratei/art-digital-miscellaneous-modern-abstract-minimalist-wallpaper-hipster-triangle-wallpapers-images.jpg?dl=1
wget -O forest.jpg https://www.dropbox.com/s/kix5aok6ywymeid/HD_Nature_Wallpapers_by_CurtiXs.jpg?dl=1
