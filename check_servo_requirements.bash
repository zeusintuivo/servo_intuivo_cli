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


