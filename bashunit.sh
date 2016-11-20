#!/bin/bash

# Copyright 2016 Alessandra Bilardi. All Rights Reserved.
# Released under the MIT License.
# Author: alessandra.bilardi@gmail.com (Alessandra Bilardi)
#
# Test library.
#
# This script contains the basic functions for running your tests

# initialize
VERSION="0.0.1"
PASSED=0
FAILED=0

# functions

# The script version
#
# Returns:
#   string: version number
function version {
    echo BashUnit $VERSION
}

# The script help
#
# Returns:
#   string: script manual
function help {
    cat <<EOF
bashunit.sh(1) -- Test library
=================================

## SYNOPSIS

\`bashunit.sh\` [-hV]

## OPTIONS

  \`-h, --help\`              display this message

  \`-V, --version\`           output version

  \`-t, --test\`              path of your test file or directory

## USAGE

    ./bashunit.sh -t [file|directory]

  Use the follow functions have three arguments: message, result, [value]

    assertLike # to compare result with a pattern and the comparison is true

    assertNotLike # to compare result with a pattern and the comparison is false

    assertSame # to compare result with a string and the comparison is true

    assertNotSame # to compare result with a string and the comparison is false

    assertNull # the result is null or zero-length 

    assertNotNull # the result is not null or no empty

    assertTrue # the result is true

    assertFalse # the result is false

## AUTHOR

  - Alessandra Bilardi <alessandra.bilardi@gmail.com>

## REPORTING BUGS

  - https://github.com/bilardi/bashunit/issues

## SEE ALSO

  \`test\`(1), \`source\`(1)

## LICENSE

  MIT (C) Copyright Alessandra Bilardi 2016

EOF
}

# If the condition is true, test passes, else test fails
#
# Args:
#   message: string: name of function caller
#   condition: string: 
# Returns:
#   mixed: string: error message
function assert {
    if [ $2 ]; then
	PASSED=$(( $PASSED + 1 ))
    else
	FAILED=$(( $FAILED + 1 ))
	echo " Error: $1" >&2
    fi
}

# Test if result contains pattern
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
#   pattern: string: regexp expected
# Returns:
#   mixed: string: error message
function assertLike {
    assert $1 [ $2 =~ $3 ]
}

# Test if result not contains pattern
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
#   pattern: string: regexp expected
# Returns:
#   mixed: string: error message
function assertNotLike {
    assert $1 [ $2 !~ $3 ]
}

# Test if result is the same with value
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
#   value: string: string expected
# Returns:
#   mixed: string: error message
function assertSame {
    assert $1 [ "$2" == "$3" ]
}

# Test if result is not the same with value
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
#   value: string: string expected
# Returns:
#   mixed: string: error message
function assertNotSame {
    assert $1 [ "$2" != "$3" ]
}

# Test if result is null or zero length
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
# Returns:
#   mixed: string: error message
function assertNull {
    assert $1 [ -z "$2" ]
}

# Test if result is not null
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
# Returns:
#   mixed: string: error message
function assertNotNull {
    assert $1 [ -n "$2" ]
}

# Test if result is true
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
# Returns:
#   mixed: string: error message
function assertTrue {
    assert $1 [ "$2" ]
}

# Test if result is false
#
# Args:
#   message: string: name of function caller
#   result: string: result of the script test
# Returns:
#   mixed: string: error message
function assertFalse {
    assert $1 [ ! "$2" ]
}

# Load test scripts
#
# Args:
#   path: string: file or directory of test scripts
function loadTest {
    if [ -d "$1" ]; then
	ls $1 | while read f; do
		    if [ -e $1/$f ]; then
			source $1/$f
		    fi
		  done
    else
	source $1
    fi
}

# main
## get options of the script
while true; do
    case "$1" in
	-h | --help ) help; exit 1 ;;
	-V | --version ) version; exit 1 ;;
	-t | --test ) loadTest $2; shift; ;;
	-- ) shift; break ;;
	* ) break ;;
    esac
    shift
done

## report
if [[ "$PASSED" != "0" ]] || [[ "$FAILED" != "0" ]]; then
    echo Test Passed: $PASSED, Test Failed: $FAILED.
else
    help
fi
