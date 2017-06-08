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
 "
cd /_/servo
RUST_BACKTRACE=1 ./mach build --dev