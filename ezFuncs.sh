#!/bin/sh
################################################################################
# ezFuncs
#   desc      A small collection of shell commands to make life easier
#             Include with "source ezFuncs.sh"
#   version   v0.1
#   by        alias1
#   contribs  null
#   url
#    ezFuncs  https://github.com/alias1/ezFuncs-sh
#    SemVer   http://semver.org/   
################################################################################

################################################################################
# trim()
#   desc    Trim head/tail whitespace
#   parm
#     $1    The line to trim whitespace from
#   return
#     retVal
#           The line with whitespace removed
#   since   v0.1
################################################################################
ezFunc.trim()
{
  retVal=$(echo "${1}" | sed -e 's/^ *//g;s/ *$//g')
}

################################################################################
# substr()
#   desc    Return the specified substring from the given line
#   parm
#     $1    The line to substring
#     $2    The beginning character
#     $3    The number of characters to slice
#   return
#     retVal
#           The specified slice of substring
#   since   v0.1
################################################################################
ezFunc.substr()
{
  retVal=$(echo "${1}" | cut -c${2}-${3})
}

################################################################################
# isCommented()
#   desc    Check whether the supplied line is commented
#   parm
#     $1    The line to be checked 
#   return
#     isCommented
#       1   The line is commented
#       0   The line is not commented
#   since   v0.1
################################################################################
ezFunc.isCommented()
{
  ISCOMMENTED=0

  # Trim then get first char
  ezFunc.trim $1
  ezFunc.substr ${retVal} 1 1
  FIRST_CHAR=${retVal}

  if [ "${FIRST_CHAR}" = "${COMMENT_CHAR}" ]
  then
    ISCOMMENTED=1
  fi
}