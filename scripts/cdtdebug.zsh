#!/usr/bin/env bash
# This is a slightly modified version of the cdtdebug.sh form the ECLPISE project
###############################################################################
# Copyright (c) 2014, 2015 Red Hat, Inc. and others
#
# This program and the accompanying materials
# are made available under the terms of the Eclipse Public License 2.0
# which accompanies this distribution, and is available at
# https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#    Red Hat Inc. - initial API and implementation
#    Marc Khouzam (Ericsson) - Update for remote debugging support (bug 450080)
###############################################################################
# @file      cdtdebug.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2021 Ignacio Vizzo, all rights reserved(for modifications)
#
###############################################################################
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
###############################################################################

export GTK_THEME="Adwaita:light"
# NOTE: If you installed on somewhere else then you should change this
CDT_DEBUGGER="$HOME/dev/cdtdebugger"
CURR_DIR=${PWD##*/}
WORKSPACE="$CDT_DEBUGGER/workspaces/$CURR_DIR"
mkdir -p "$WORKSPACE"

usage="\
Usage: $0 [ECLIPSE_OPTIONS] [-b BUILD_LOG] [TARGET_OPTION]

Debug an executable, core-file, or an existing process using the Eclipse
C/C++ Stand-alone Debugger.  Eclipse command-line options may be passed
except for -vmargs which is being used to start up the Eclipse Debugger.

Operation modes:
  -h, --help                print this help, then exit

Indexing assist options:
  -b BUILD_LOG              build log to use for compiler includes/flags

Target options:
  -a [pid]                  attach using the optional pid or prompt for a pid 
  -c COREFILE               debug core-file (should also specify executable)
  -e EXECUTABLE [ARGS...]   debug given executable (passing ARGS to main)
  -r ADDRESS:PORT           debug toward the specified remote server. Can be
                            combined with the -a option.

The -e option must be used last as subsequent options are passed to main.

Specifying insufficient arguments for a particular target will result in a
dialog displayed to enter the required values for that target.  Specifying
no target option brings up a dialog for debugging an executable with the
executable path, program arguments, and build log filled in from the last -e
invocation, if one exists.

Wiki page: <http://wiki.eclipse.org/CDT/StandaloneDebugger>"

exit_missing_arg='
  echo $0": error: option [$1] requires an argument"; exit 1'

# Parse command line.
i=0
while test $# -gt 0; do
  case $1 in
    --help | -h)
      echo "$usage"
      exit
      ;;
    -vmargs)
      echo $0": error: -vmargs option is prohibited"
      exit 1
      ;;
    -e)
      test $# = 1 && eval "$exit_missing_arg"
      options[i]="$1"
      let "i+=1"
      options[i]="$2"
      let "i+=1"
      shift
      shift
      # Get all options after -e and protect them from being
      # processed by Eclipse as Eclipse options
      while test $# -gt 0; do
        options[i]=$1
        let "i+=1"
        shift
      done
      ;;
    -c | -r)
      test $# = 1 && eval "$exit_missing_arg"
      options[i]="$1"
      let "i+=1"
      options[i]="$2"
      let "i+=1"
      shift
      shift
      ;;
    *)
      options[i]="$1"
      let "i+=1"
      shift
      ;;
  esac
done

# Calculate platform-specific jar file names
ECLIPSE_HOME=$HOME/dev/eclipse
ECLIPSE_EXEC="$ECLIPSE_HOME/eclipse"

PLUGIN_DIR="$ECLIPSE_HOME/plugins"
OSGI_JAR=$(find "$PLUGIN_DIR" -maxdepth 1 -name 'org.eclipse.osgi_*.jar' -not -name '*source*' -exec basename {} \; | tail -1)

# Run eclipse with the Stand-alone Debugger product specified
"$ECLIPSE_EXEC" -clean -product org.eclipse.cdt.debug.application.product \
  -data "$WORKSPACE" -configuration file\:"$CDT_DEBUGGER" \
  -dev file\:"$CDT_DEBUGGER/dev.properties" "${options[@]}" \
  -vmargs -Dosgi.jar=$OSGI_JAR -Declipse.home="$ECLIPSE_HOME"
