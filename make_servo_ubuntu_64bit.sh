# PREPARE UBUNTU 64 Bit

sudo apt-get install -yf autoconf automake build-essential cmake curl freeglut3-dev g++ git gperf libbz2-dev libcheese-dev libcheese-doc libcheese-gtk-dev libcheese-gtk23 libcheese7 libdbus-1-dev libdbus-glib-1-2 libdbus-glib-1-2-dbg libdbus-glib-1-dev libdbus-glib-1-doc libfreetype6-dev libgl1-mesa-dri libglib2.0-dev libglu1-mesa-dev libncurses5-dev libncursesw5-dev libosmesa6-dev libreadline-dev libsqlite3-dev libssl-dev libtool libtool-doc libxmu-dev libxmu6 llvm make pkg-config scite unzip wget xorg-dev xz-utils zlib1g-dev

# INSTALL SUBLIME 3

SUBLIMELASTESTBUILD=$(curl -L https://www.sublimetext.com/3 | grep 'The latest build is ....' | cut -c61-64)
SUBLIMENAME="sublime-text_build-${SUBLIMELASTESTBUILD}_amd64.deb"
cd ~/Downloads/
curl -O https://download.sublimetext.com/${SUBLIMENAME}
sudo dpkg -i ${SUBLIMENAME}

# PREPARE PYTHON

curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash


echo 'export PATH="~/.pyenv/bin:$PATH"'>> .bashrc
echo 'eval "$(pyenv init -)"' >> .bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
python --version 


pyenv install 2.7.11
pyenv global 2.7.11
pyenv global
python --version 

STOP! Close and Reopen Terminal to use new Python. 
# Check Python Version
python --version 

pip install --upgrade pip
pip install setuptools dbus-python virtualenv

# BUILD SERVO

sudo mkdir /_
sudo chown -R $USER:$USER /_
cd /_
git clone --depth 1 --single-branch https://github.com/servo/servo

cd servo

./mach build --dev
./mach run --dev tests/html/about-mozilla.html
