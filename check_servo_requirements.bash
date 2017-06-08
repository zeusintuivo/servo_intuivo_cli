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
  # Requirement only to have a script
  scite
"
install_apt_get_should_not_be_installed "Ubuntu 14.04 64 Bits" "
  # Requirements for libOSMesa
      libosmesa6-dev
      libosmesa6-dbg
      libosmesa6
  # Remove old llvm
      llvm-3.4
      llvm-3.4-dev
      llvm-3.4-runtime
 "

    echo "wget gpg.key & apt-key add - "

wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -   >/dev/null 2>&1;
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421

sudo add-apt-repository "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-4.0 main"


    echo "update -y "

sudo apt-get update -y  >/dev/null 2>&1;

install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
  # Requiment to use llvm new
    clang-4.0
    lldb-4.0
    lld-4.0
"
install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
  # Requiment to use llvm new
    clang-4.0
    clang-4.0-doc
    libclang-common-4.0-dev
    libclang-4.0-dev
    libclang1-4.0
    libclang1-4.0-dbg
"
install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
  # Requiment to use llvm new
     libllvm-4.0-ocaml-dev
     libllvm4.0
     libllvm4.0-dbg
     lldb-4.0
     llvm-4.0
     llvm-4.0-dev
     llvm-4.0-doc
"
install_apt_get_requirements "Ubuntu 14.04 64 Bits" "
  # Requiment to use llvm new
    llvm-4.0-examples
    llvm-4.0-runtime
    clang-format-4.0
    python-clang-4.0
    liblldb-4.0-dev
    lld-4.0
    libfuzzer-4.0-dev
"

clang --version

dpkg -l "*clang*" | grep ii | awk '{ print $2 }' | tr '\n' ' '
dpkg -l "*llvm*" | grep ii | awk '{ print $2 }' | tr '\n' ' '


#verify_installed_version "llc --version | grep version"  "4.0"



cd /_/servo
RUST_BACKTRACE=1 ./mach build --dev