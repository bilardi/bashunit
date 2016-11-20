#!/bin/bash

# Copyright 2016 Alessandra Bilardi. All Rights Reserved.
# Released under the MIT License.
# Author: alessandra.bilardi@gmail.com (Alessandra Bilardi)
#
# Unit test.
#
# This script contains the basic test of the bashunit script.

# initialize
BIN="./bashunit.sh"

# main
assertLike "function version -V" "$(./$BIN -V)" ""
assertLike "function version --version" "$(./$BIN --version)" "[0-9]+.[0-9]+.[0-9]+"
