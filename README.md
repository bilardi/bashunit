# Bash Unit

This package contains a script to run your functional and integration tests.
It is part of the [educational repositories](https://github.com/pandle/materials) to learn how to write stardard code and common uses of the TDD.

## Installation

The package is self-consistent: if you want integrate it in your project, add the bashunit.sh file where you want into your code.

Test installation

    make test

Global installation

    make install

## Usage

Read the [guide](bashunit.1.md) or

    ./bashunit.sh --help

or

    man ./bashunit.1

For global installation

    bashunit --help

or

    man bashunit

## Development

Create man (using [kapouer/ronnjs](https://github.com/kapouer/ronnjs))

    make man

Test it-self

    ./bashunit.sh --test test.sh

## License

This package is released under the MIT license.  See [LICENSE](LICENSE) for details.

