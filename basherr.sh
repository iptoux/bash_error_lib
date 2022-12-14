#!/bin/bash
#
# Bash error library            @version: 1.2.4
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

# setting up Traps
trap 'bs_error_trap "$?" "${BASH_SOURCE[0]}" "${LINENO}" "${FUNCNAME}"' ERR
trap 'bs_error_trap "$?" "${BASH_SOURCE[0]}" "${LINENO}" "${FUNCNAME}"' EXIT


############ EXAMPLES ############
# uncomment to drop error (only one will be displayd)


# Syntax error -> nothing in function
#hello_world() {    # <-
#                   # <-
#}                  # <-
#hello_world        # <-



# Unknown command or an unknown function of
# script.

#somecommand        # <-

huhu() {

_error "this is an random error"

}

huhu

# Disable debug output
bs_debug false                              # Can be disabled at any line