bashunit.sh(1) -- Test library
=================================

## SYNOPSIS

`bashunit.sh` [-hV]

## OPTIONS

  `-h, --help`              display this message

  `-V, --version`           output version

  `-t, --test`              path of your test file or directory

## USAGE

    ./bashunit.sh -t [file|directory]

  Use the follow functions have three arguments: message result [value]

    assertLike # to compare result with a pattern and the comparison is true

    assertNotLike # to compare result with a pattern and the comparison is false

    assertSame # to compare result with a string and the comparison is true

    assertNotSame # to compare result with a string and the comparison is false

    assertNull # the result is null or zero-length 

    assertNotNull # the result is not null or no empty

    assertTrue # the result is true

    assertFalse # the result is false

  See examples in https://raw.githubusercontent.com/bilardi/bashunit/0.8.1/test.sh

## AUTHOR

  Alessandra Bilardi <alessandra.bilardi@gmail.com>

## REPORTING BUGS

  https://github.com/bilardi/bashunit/issues

## SEE ALSO

  `test`(1), `source`(1)

## LICENSE

  MIT (C) Copyright Alessandra Bilardi 2016

