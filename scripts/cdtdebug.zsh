#!/usr/bin/env bash
# @file      cdtdebug.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2021 Ignacio Vizzo, all rights reserved
#
# Instructions:
#
# You should read at least once the offical documentation:
#   - https://wiki.eclipse.org/CDT/StandaloneDebugger
#
# Then following the "Try out Full Eclipse Installation" section from previous page, :
#   1. Download the IDE for C/C++ Developers tar file for your platform
# https://www.eclipse.org/downloads
#   2. Untar the C/C++ IDE into a local directory (let's call this $CDT_DIR)
#   3. cd $CDT_DIR/eclipse/plugins/org.eclipse.cdt.debug.application_*/scripts
#   4. There, run the command:
#        - /bin/sh ./install.sh
#        - this will create the directory: $HOME/cdtdebugger for you where the cdtdebug.sh script
#          will be installed
#   5. To run the debugger:
#        - $HOME/cdtdebugger/cdtdebug.sh ... (see above or use --help option for arguments) this
#          will default to use the workspace: workspace-cdtdebug if you do not specifiy a workspace
#          via the -data option

export GTK_THEME="Adwaita:light"
CURR_DIR=${PWD##*/}
CDT_DEBUGGER="$HOME/dev/cdtdebugger"
WORKSPACE="$CDT_DEBUGGER/workspaces/$CURR_DIR"
PROGRAM=$@

usage() {
  cat <<EOF
Usage: ${0##*/} [-h] [-c/--core] [-p/--pid]
Launch a gdb session using the standalone cdtdebugger, also possible to debug core files

    -h          display this help and exit
    -c corefile If you want to do post mostern debug provide the core file. Due
                Implementation issues, you can only run this as the following:
                ${0##*/} -c <corefile> <program>
    -p pid      Attach gdb session to running process. Does not check if the pid
                actully exists
EOF
}

while test $; do
  case $1 in
    -h | -\? | --help)
      usage
      exit
      ;;
    -c | --core)
      if [ "$2" ]; then
        CORE=$2
        shift
      else
        echo 'ERROR: "-c / --core" requires a non-empty option argument.'
        exit 1
      fi
      ;;
    -p | --pid)
      if [ "$2" ]; then
        PID=$2
        shift
      else
        echo 'ERROR: "-p / --pid" requires a non-empty option argument.'
        exit 1
      fi
      ;;
    --)
      shift
      break
      ;;
    -?*)
      printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
      ;;
    *)
      break
      ;;
  esac

  shift
done

# Create sort of "unique" folder for the cdt-debug shit
mkdir -p "$WORKSPACE"

if [ "$CORE" ]; then
  echo "Debugging corefile $CORE, program $PROGRAM"
  $CDT_DEBUGGER/debugger/cdtdebug -data $WORKSPACE -c "$CORE" -e "$PROGRAM"
elif [ "$PID" ]; then
  PROCES_NAME=$(ps -p $PID -o comm=)
  echo "Debugging process $PROCES_NAME with pid=$PID"
  $CDT_DEBUGGER/debugger/cdtdebug -data $WORKSPACE -a "$PID"
else
  # Run the cdt-debugger on the workspace
  echo "Debugging $PROGRAM"
  $CDT_DEBUGGER/debugger/cdtdebug -data $WORKSPACE -e "$PROGRAM"
fi

return 0
