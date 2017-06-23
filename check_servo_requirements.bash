#!/usr/bin/env bash
#
# @author Zeus Intuivo <zeus@intuivo.com>
#
#

load_check_system_requirements_wget(){
    local provider="/_/clis/execute_command_intuivo_cli/check_system_requirements"
    [   -e "${provider}"  ] && source "${provider}"
    [ ! -e "${provider}"  ] && eval """$(wget --quiet --no-check-certificate  https://raw.githubusercontent.com/zeusintuivo/execute_command_intuivo_cli/master/check_system_requirements -O -  2>/dev/null )"""   # suppress only wget download messages, but keep wget output for variable
    ( ( ! command -v type passed >/dev/null 2>&1; ) && echo -e "\\033[1;31m Halt ! \\033[38;5;227m
- This file was meant to be use with the check_system_requirements.sh system.
- check_system_requirements File not found!
\\033[0m" && exit 69; )
} # end load_check_system_requirements_wget
load_check_system_requirements_wget

load_struct_testing_wget(){
    local provider="/_/clis/execute_command_intuivo_cli/struct_testing"
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
    libdrm
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
/_/clis

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


working commit when it worked

f0c3543f53ac37dbd14741fba3678fdbd01343cc



cd /_/
rm -rf servo
cd
git clone --depth 1 --single-branch https://github.com/servo/servo
cd servo
RUST_BACKTRACE=1 ./mach build --dev



