#!/usr/bin/env bash
#!/bin/bash
#
# @author Zeus Intuivo <zeus@intuivo.com>
#
# PREPARE UBUNTU 16.04 64 Bit

if ( ( command -v cmake >/dev/null 2>&1; ) && ( command -v make >/dev/null 2>&1; ) ) ; then
  {
    echo "CMAKE and Make Installed :)"
  }
else
  {
    sudo apt-get install -yf autoconf automake build-essential cmake curl freeglut3-dev g++ git gperf libbz2-dev libcheese-dev libcheese-doc libcheese-gtk-dev libcheese-gtk25 libcheese8 libdbus-1-dev libdbus-glib-1-2 libdbus-glib-1-2-dbg libdbus-glib-1-dev libdbus-glib-1-doc libfreetype6-dev libgl1-mesa-dri libglib2.0-dev libglu1-mesa-dev libncurses5-dev libncursesw5-dev libosmesa6-dev libreadline-dev libsqlite3-dev libssl-dev libtool libtool-doc libxmu-dev libxmu6 llvm make pkg-config scite unzip wget xorg-dev xz-utils zlib1g-dev
  }
fi


if command -v VBoxManage >/dev/null 2>&1; then
  {
    echo "VBoxManage Installed :)"
  }
else
  {
    sudo apt -fy install virtualbox
  }
fi

if command -v subl >/dev/null 2>&1; then
  {
    echo "Sublime Installed :)"
  }
else
  {

    # INSTALL SUBLIME 3

    SUBLIMELASTESTBUILD=$(curl -L https://www.sublimetext.com/3 | grep 'The latest build is ....' | cut -c61-64)

    wait

    SUBLIMENAME="sublime-text_build-${SUBLIMELASTESTBUILD}_amd64.deb"
    # Mac
    # SUBLIMENAME="Sublime%20Text%20Build%20${SUBLIMELASTESTBUILD}.dmg"
    wait

    cd ~/Downloads/
    curl -O https://download.sublimetext.com/${SUBLIMENAME}

    wait

    sudo dpkg -i ${SUBLIMENAME}
    # Mac
    # sudo hdiutil attach ${SUBLIMENAME}
    # wait
    # sudo cp -R /Volumes/Sublime\ Text/Sublime\ Text.app /Applications/
    # wait
    # sudo hdiutil detach /Volumes/Sublime\ Text
    wait


  }
fi


if command -v python >/dev/null 2>&1; then
  {
    echo "Python Installed :)"
  }
else
  {
    sudo apt-get -yf install python
  }
fi

if command -v pyenv >/dev/null 2>&1; then
  {
    echo "Pyenv Installed :)"
  }
else
  {

    # PREPARE PYTHON

    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    wait

    echo " " >>  ~/.bashrc
    echo "# PYENV" >>  ~/.bashrc
    echo "export PATH=\"~/.pyenv/bin:\$PATH\"" >>  ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc


    export PATH="~/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    wait
    eval "$(pyenv virtualenv-init -)"
    wait
    python --version


    pyenv install 2.7.11
    wait
    pyenv global 2.7.11
    pyenv global
    python --version

  }
fi
wait

python_version=$(pyenv global)
if [ -z ${python_version+x} ] || [[ "$python_version" != "2.7.11" ]] ; then
  {
    echo "STOP!!! - Python version is wrong. = .$python_version.  Open a new tab and try again. ";
    exit 130;
  }
else
  {
    echo "Python Version 2.7.11 In use and Installed :)"
  }
fi


if command -v pip >/dev/null 2>&1; then
  {
    echo "Pip Installed :)"
  }
else
  {
    echo "STOP!!! - PIP, from python is not responding. ";
    exit 130;
  }
fi

if command -v virtualenv >/dev/null 2>&1; then
  {
    echo "Virtualenv Installed :)"
  }
else
  {
    pip install --upgrade pip
    wait
    pip install setuptools dbus-python virtualenv
    wait
  }
fi

# BUILD SERVO

if ( (([ ! -e  /_ ]) && ([ -d /_ ] || [ -L /_ ] ))) ; then
  {
   echo "/_ already exists"
  }
else
  {
   sudo mkdir /_
   sudo chown -R $USER /_
  }
fi

# TEST USER PERMSIONS TO ACCESS FOLDER
perm=$(stat -c %a "/_")

if [ "$perm" = "755" ] || [ "$perm" = "777" ]; then
  {
    echo "/_ permissions are $perm fine"
  }
else
  {
    echo "Wrong Folder Permisions for /_ -> $perm"
    exit 130;
  }
fi


echo "Cloning" ;

cd /_
git clone --depth 1 --single-branch https://github.com/servo/servo
wait

cd servo
wait

./mach build --dev
wait
./mach run --dev tests/html/about-mozilla.html
wait

./mach build --release
wait

./mach run --release tests/html/about-mozilla.html
wait
