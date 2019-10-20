#!/usr/bin/env bash
#
# @author Zeus Intuivo <zeus@intuivo.com>
#
#

load_check_system_requirements_wget(){
    local provider="$HOME/_/clis/execute_command_intuivo_cli/check_system_requirements"
    [   -e "${provider}"  ] && source "${provider}"
    [ ! -e "${provider}"  ] && eval """$(wget --quiet --no-check-certificate  https://raw.githubusercontent.com/zeusintuivo/execute_command_intuivo_cli/master/check_system_requirements -O -  2>/dev/null )"""   # suppress only wget download messages, but keep wget output for variable
    ( ( ! command -v type passed >/dev/null 2>&1; ) && echo -e "\\033[1;31m Halt ! \\033[38;5;227m
- This file was meant to be use with the check_system_requirements.sh system.
- check_system_requirements File not found!
\\033[0m" && exit 69; )
} # end load_check_system_requirements_wget
load_check_system_requirements_wget

load_struct_testing_wget(){
    local provider="$HOME/_/clis/execute_command_intuivo_cli/struct_testing"
    [   -e "${provider}"  ] && source "${provider}"
    [ ! -e "${provider}"  ] && eval """$(wget --quiet --no-check-certificate  https://raw.githubusercontent.com/zeusintuivo/execute_command_intuivo_cli/master/struct_testing -O -  2>/dev/null )"""   # suppress only wget download messages, but keep wget output for variable
    ( ( ! command -v type passed >/dev/null 2>&1; ) && echo -e "\n \n  ERROR! Loading struct_testing \n \n " && exit 69; )
} # end load_struct_testing_wget
load_struct_testing_wget

install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
  # Requiment to download code
      git
      curl
      unzip
  # Requiment to build code
      autoconf
      automake
      build-essential
      cmake
      freeglut3-dev
      g++
      make
      gperf
      libbz2-dev
      libcheese-dev
      libcheese-doc
      libcheese-gtk-dev
      libcheese-gtk23
      libcheese7
      libdbus-1-dev
      libdbus-glib-1-2
      libdbus-glib-1-2-dbg
      libdbus-glib-1-dev
      libdbus-glib-1-doc
      libfreetype6-dev
      libglib2.0-dev
      libssl-dev
      libssl-dev
      libtool
      libxmu-dev
      libxmu6
      pkg-config
      xorg-dev
      zlib1g-dev
      libreadline6
      libreadline6-dev
      libsqlite3-dev
  # Requirements only for vagrant environment
     virtualbox
  # Perhaps new requirements
      libgl1-mesa-dri
      libglu1-mesa-dev
      libedit-dev
      libncurses5
      libncurses5-dbg
      libncurses5-dev
  # Requirement for llvm manual compile
    libdrm-dev
    libdrm2
    libdrm-dbg
 "

install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
   libglapi-mesa
"

install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
    # free implementation of the GL API -- shared library
    libglapi-mesa
    # free implementation of the GL API -- debugging symbols
    libglapi-mesa-dbg
    # - Transitional package for libglapi-mesa
    libglapi-mesa-lts-trusty
    # - Transitional package for libglapi-mesa-dbg
    libglapi-mesa-lts-trusty-dbg

  # to use apt-cache search
    apt-file
  # Editor
    scite
"
#install_apt_get_should_
#not_be_installed "Ubuntu 14.04 64 Bits" "
#  # Requirements for libOSMesa
#      libosmesa6-dev
#      libosmesa6-dbg
#      libosmesa6
#  # Remove old llvm
#      llvm-3.4
#      llvm-3.4-dev
#      llvm-3.4-runtime
# "

##
# echo "wget gpg.key & apt-key add - "
#
# wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -   >/dev/null 2>&1;
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421
# sudo add-apt-repository "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-4.0 main"  >/dev/null 2>&1;
#
# echo "update -y "
#
# sudo apt-get update -y  >/dev/null 2>&1;
#
# install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
#   # Requiment to use llvm new
#     clang-4.0
#     lldb-4.0
#     lld-4.0
# "
# install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
#   # Requiment to use llvm new
#     clang-4.0
#     clang-4.0-doc
#     libclang-common-4.0-dev
#     libclang-4.0-dev
#     libclang1-4.0
#     libclang1-4.0-dbg
# "
# install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
#   # Requiment to use llvm new
#      libllvm-4.0-ocaml-dev
#      libllvm4.0
#      libllvm4.0-dbg
#      lldb-4.0
#      llvm-4.0
#      llvm-4.0-dev
#      llvm-4.0-doc
# "
# install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
#   # Requiment to use llvm new
#     llvm-4.0-examples
#     llvm-4.0-runtime
#     clang-format-4.0
#     python-clang-4.0
#     liblldb-4.0-dev
#     lld-4.0
#     libfuzzer-4.0-dev
# "

# clang --version
#
# dpkg -l "*clang*" | grep ii | awk '{ print $2 }' | tr '\n' ' '
# dpkg -l "*llvm*" | grep ii | awk '{ print $2 }' | tr '\n' ' '

#wget -nc ftp://ftp.freedesktop.org/pub/mesa/current/mesa-10.5.4.tar.xz
#wget -nc http://cygwin.mirror.constant.com/x86_64/release/mesa/mesa-17.0.6-1.tar.xz
# [ ! -f mesa-17.0.6-1-src.tar.xz ] && wget -nc http://cygwin.mirror.constant.com/x86_64/release/mesa/mesa-17.0.6-1-src.tar.xz
#tar Jxf mesa-10.5.4.tar.xz
# [ ! -d mesa-17.0.6-1-src/ ] && tar Jxf mesa-17.0.6-1-src.tar.xz
#cd mesa-10.5.4/
# cd mesa-17.0.6*
# [ ! -d mesa-17.0.6/ ] && tar Jxf mesa-17.0.6.tar.xz
# cd mesa-17.0.6*

# autoreconf -fi

#./configure \
# CXXFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31" \
# CFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31" \
# --disable-xvmc \
# --disable-glx \
# --disable-dri \
# --with-dri-drivers="" \
# --with-gallium-drivers="" \
# --disable-shared-glapi \
# --disable-egl \
# --with-egl-platforms="" \
# --enable-osmesa \
# --enable-gallium-llvm=no \
# --prefix=/usr/local/mesa/10.2.2/classic

# ./configure \
# CXXFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31" \
# CFLAGS="-O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31" \
# --disable-xvmc \
# --disable-glx \
# --disable-dri \
# --without-OSMesa \
# --with-dri-drivers="" \
# --with-gallium-drivers="" \
# --disable-shared-glapi \
# --disable-egl \
# --with-egl-platforms="" \
# --enable-gallium-llvm=no \
# --prefix=/usr/local/mesa/17.0.6/classic
# ake -j4
#  optional
# ake check
# udo make install



#verify_installed_version "llc --version | grep version"  "4.0"


exit 0



if (( $? == 0 )) ;  then
  cd /_/servo
  RUST_BACKTRACE=1 ./mach build --dev
fi



Ubuntu 14.04

sudo add-apt-repository "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty main"
sudo add-apt-repository "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty main"
# 3.8
sudo add-apt-repository "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.8 main"
sudo add-apt-repository "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.8 main"

sudo apt-get install python-lldb-3.8  -y
wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key  | sudo apt-key add -
sudo apt-get install clang-3.8 lldb-3.8 -yf

# download and copy
# Clang 3.9.1

# into $HOME clang+llvm-3.9.1
# un zip
su passwd

cd  $HOME
[ ! -f clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-14.04.tar.xz ] && wget -nc http://releases.llvm.org/3.9.1/clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-14.04.tar.xz

tar Jxf  clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-14.04.tar.xz

su <<< "#
"
cd /usr/

cp -drvf /home/zeus/clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-14.04/. .

sudo apt-get install libva-dev -y




How to copy
rsync -vrxXEH /home/zeus/clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-14.04/ .
 cp -drvf /home/zeus/clang+llvm-3.9.1-x86_64-linux-gnu-ubuntu-14.04/. .

Guest additions
sudo apt-get install dkms

Share folder
$HOME/_/clis

soft link folder
ls  /media/
ln -s /media/sf_clis clis

# reset pass
sudo passwd

# work folder setup
sudo mkdir /_
sudo chown -R $USER:$USER /_

# clone
cd
git clone --depth 1 --single-branch https://github.com/servo/servo
cd servo
RUST_BACKTRACE=1 ./mach build --dev

# groups

# Ubuntu
su
id -Gn
$USUARIO="zeus"
groupadd  www-data
useradd -G www-data $USUARIO
useradd -G www-data root
groupadd  vboxsf
useradd -G vboxsf $USUARIO
useradd -G vboxsf root
groupadd  staff
useradd -G staff $USUARIO
useradd -G staff root
groupadd rvm
useradd -G rvm $USUARIO
useradd -G rvm root
groupadd wheel
useradd -G wheel $USUARIO
useradd -G wheel root
groups root
groups $USUARIO
echo "Reboot or LOG OUT AND LOG IN .. to have Groups Loaded  "
touch step2.install
reboot
# CentOS

echo "Add groups "

$USUARIO="zeus"
id -Gn

sudo groupadd  www-data
sudo usermod -a -G www-data $USUARIO
sudo usermod -a -G www-data root
sudo groupadd  vboxsf
sudo usermod -a -G vboxsf $USUARIO
sudo usermod -a -G vboxsf root
sudo groupadd  staff
sudo usermod -a -G staff $USUARIO
sudo usermod -a -G staff root
sudo groupadd rvm
sudo usermod -a -G rvm $USUARIO
sudo usermod -a -G rvm root
sudo groupadd wheel
sudo usermod -a -G wheel $USUARIO
sudo usermod -a -G wheel root

echo "Reboot or LOG OUT AND LOG IN .. to have Groups Loaded  "
touch step2.install
--- stderr
configure: WARNING: Building mesa with statically linked LLVM may cause compilation issues
cc1plus: error: -Werror=date-time: no option -Wdate-time
make[4]: *** [gallivm/lp_bld_debug.lo] Error 1
make[3]: *** [all-recursive] Error 1
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2
make: *** [all-recursive] Error 1
thread 'main' panicked at 'failed with: exit code: 2', /home/zeus/servo/.cargo/git/checkouts/osmesa-src-bf84ce2b80210dd7/42509fb/build.rs:52
stack backtrace:
   0: std::sys::imp::backtrace::tracing::imp::unwind_backtrace



Ubuntu 16.04

    sudo apt-get install -yf autoconf automake build-essential cmake curl freeglut3-dev g++ git gperf libbz2-dev libcheese-dev libcheese-doc libcheese-gtk-dev libcheese-gtk25 libcheese8 libdbus-1-dev libdbus-glib-1-2 libdbus-glib-1-2-dbg libdbus-glib-1-dev libdbus-glib-1-doc libfreetype6-dev libgl1-mesa-dri libglib2.0-dev libglu1-mesa-dev libncurses5-dev libncursesw5-dev libosmesa6-dev libreadline-dev libsqlite3-dev libssl-dev libtool libtool-doc libxmu-dev libxmu6 llvm make pkg-config scite unzip wget xorg-dev xz-utils zlib1g-dev

git clone --depth 1 --single-branch https://github.com/servo/servo

cd servo


echo ":)"




Fedora NOTES


    1  cd /_
    2  sudo mkdir /_
    3  cd 7_
    4  cd /_
    5  sudo chown -R $USER:$USER
    6  sudo chown -R $USER:$USER /_
    7  git clone https://github.com/servo/servo
    8  sudo dnf install curl freeglut-devel libtool gcc-c++ libXi-devel     freetype-devel mesa-libGL-devel mesa-libEGL-devel glib2-devel libX11-devel libXrandr-devel gperf     fontconfig-devel cabextract ttmkfdir python python-virtualenv python-pip expat-devel     rpm-build openssl-devel cmake bzip2-devel libXcursor-devel libXmu-devel mesa-libOSMesa-devel     dbus-devel
    9  git clone https://github.com/servo/servo
   10  cd servo/
   11  ./mach build --dev
   12  pip install dbus
   13  pip install --upgrade pip
   14  python --version
   15  pyenv
   16  py-env
   17  echo $PATH
   18  echo %PATH%
   19  [Warning] Could not generate notification! Optional Python module 'dbus' is not installed.
   20  sudo pip install --upgrade pip
   21  pip install dbus
   22  uname
   23  uname -r
   24  uname -w
   25  uname -m
   26  nix
   27  nix-env
   28  pyenv
   29  dnf
   30  df -h
   31  uname -r
   32  sudo -i
   33  apt-get
   34  sudo rpm update -y
   35  sudo rpm update
   36  sudo yum update -y
   37  sudo mkdir /media/VirtualBoxGuestAdditions
   38  mount -r /dev/cdrom /media/VirtualBoxGuestAdditions/
   39  sudo mount -r /dev/cdrom /media/VirtualBoxGuestAdditions/
   40  sudo dnf install dkms -y
   41  sudo dnf install kernel-devel kernel-headers dkms  make bzip2 perl -y
   42  KERN_DIR=/usr/src/kernels/`uname -r`
   43  echo $KERN_DIR
   44  export KERN_DIR
   45  cd /media/VirtualBoxGuestAdditions/
   46  ls
   47  ./VBoxLinuxAdditions.run
   48  sudo ./VBoxLinuxAdditions.run
   49  cd /media/
   50  ls
   51  cd VirtualBoxGuestAdditions/
   52  ls
   53  sudo mount -r /dev/cdrom /media/VirtualBoxGuestAdditions/
   54  ls
   55  cd ..
   56  rmdir
   57  rmdir /media/VirtualBoxGuestAdditions/
   58  sudo rmdir /media/VirtualBoxGuestAdditions/
   59  umount -a
   60  sudo umount -a
   61  ls
   62  sudo rmdir VirtualBoxGuestAdditions/
   63  ls
   64  cd VirtualBoxGuestAdditions/
   65  ls
   66  df -h
   67  cd /run/media/zeus/VBOXADDITIONS_5.0.24_108355
   68  ls
   69  sudo ./runasroot.sh
   70  sudo -i
   71  cd /_/servo/
   72  ls -la
   73  cd ..
   74  ls -la
   75  cd servo/
   76  git log
   77  cd /_/
   78  rm -rf servo
   79  cd
   80  git clone --depth 1 --single-branch https://github.com/servo/servo
   81  cd servo
   82  RUST_BACKTRACE=1 ./mach build --dev





working commit when it worked


you can switch to that where it used to work
commit f0c3543f53ac37dbd14741fba3678fdbd01343cc



cd /_/
rm -rf servo
cd
git clone --depth 1 --single-branch https://github.com/servo/servo
cd servo
RUST_BACKTRACE=1 ./mach build --dev




Ubuntu 14.04 32 bits

git log hash version that works  86b2104f11ce1070818e07728160085914521aa0



