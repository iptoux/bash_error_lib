#!/bin/bash
#
# Bash error library            @version: 1.0.0
# 
# This is an example how the library can be used in an
# script. Just source the library and setup the traps to
# call the function
#
# All needed settings can be done in head of the library 
# file. It is also posible to export the vars in an external
# file, than you have to source/load/set them before the
# library.
#
# For more details read&visit 
# https://github.com/iptoux/bash_error_lib/wiki


############ SOURCE LIBRARY ############
. 'lib/bash_error_lib'                      # bs_debug looks for arg -$yourarg on cmd to enable it fast.

# Enable Debug output.
bs_debug true                               # after sourcing of lib or by commandline option (set in lib)

############ LOAD TRAPS ############

trap 'bs_error "$?" "${FUNCNAME[0]}"' ERR
trap 'bs_error "$?" "${FUNCNAME[0]}"' EXIT
trap 'bs_clean' EXIT


############ EXAMPLES ############
# uncomment to drop error (only one will be displayd)


# Syntax error -> nothing in function
#hello_world() {    # <-
#                   # <-
#}                  # <-
#hello_world        # <-

# Disable debug output
bs_debug false                              # Can be disabled at any line

# Unknown command or an unknown function of
# script.

#somecommand        # <-
