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
assertLike "function version -V" "$(./$BIN -V)" "[0-9]+.[0-9]+.[0-9]+"
assertLike "function version -V - it should fail" "$(./$BIN -V)" "[0-9]+.[a-z]+.[0-9]+"
assertNotLike "function version --version" "$(./$BIN --version)" "[0-9]+.[a-z]+.[0-9]+"
assertNotLike "function version --version - it should fail" "$(./$BIN --version)" "[0-9]+.[0-9]+.[0-9]+"
assertSame "test string - same" "BashUnit 0.0.1" "BashUnit 0.0.1"
assertSame "test string - same - it should fail" "BashUnit 0.0.1" "BashUnit 0.0.2"
assertNotSame "test string - not same" "BashUnit 0.0.1" "BashUnit 0.0.2"
assertNotSame "test string - not same - it should fail" "BashUnit 0.0.1" "BashUnit 0.0.1"
assertNull "test string length zero" ""
assertNull "test string length zero - it should fail" "not zero"
assertNotNull "test string length not zero" "not zero"
assertNotNull "test string length not zero - it should fail" ""
assertTrue "test string true" "1"
assertTrue "test string true - it should fail" ""
assertFalse "test string false" ""
assertFalse "test string false - it should fail" "0"
