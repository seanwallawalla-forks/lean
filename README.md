[![Build Status](https://travis-ci.org/leodemoura/lean.png?branch=master)](https://travis-ci.org/leodemoura/lean)

Requirements
============

- C++11 compatible compiler
- GMP (GNU multiprecision library)
  http://gmplib.org/
- MPFR (GNU MPFR Library)
  http://www.mpfr.org/
- (optional) gperftools
  https://code.google.com/p/gperftools/
- cmake
  http://www.cmake.org
- flex++ (lex generator)
- bison++ (parser generator)

Install Packages on Ubuntu
--------------------------

Instructions for installing gperftools on Ubuntu

    sudo add-apt-repository ppa:agent-8131/ppa
    sudo apt-get update
    sudo apt-get dist-upgrade
    sudo apt-get install libgoogle-perftools-dev

Instructions for installing flex on Ubuntu

    sudo apt-get install flex

Instructions for installing bison on Ubuntu

    sudo apt-get install bison++

Instructions for installing gcc-4.8 (C++11 compatible) on Ubuntu

    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
    sudo update-alternatives --remove-all gcc
    sudo update-alternatives --remove-all g++
    sudo apt-get update
    sudo apt-get install g++-4.8 -y
    sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

Instructions for installing clang-3.3 (C++11 compatible) on Ubuntu

    sudo add-apt-repository ppa:h-rayflood/llvm
    sudo apt-get update
    sudo apt-get dist-upgrade
    sudo apt-get install clang-3.3 clang-3.3-doc

Note that you [still need][1] to have g++-4.8's C++ runtime library to
support some C++11 features that we are using.

You can specify the C++ compiler to use by using ``-DCMAKE_CXX_COMPILER``
option. For example

    cmake -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_CXX_COMPILER=clang++-3.3 ../../src

[1]: http://clang.llvm.org/cxx_status.html

Install Packages on OS X
------------------------
We assume that you are using [homebrew][homebrew], "The missing package manager for OS X".

[homebrew]: http://brew.sh

Instructions for installing gperftools on OS X 10.8

    $ brew install gperftools

Instructions for installing gcc-4.8 (C++11 compatible) on OS X 10.8

    $ brew tap homebrew/versions
    $ brew install gcc48

Instructions for installing clang-3.3 (C++11 compatible) on OS X 10.8

    $ brew install llvm --with-clang --with-asan

Install Packages on Cygwin
--------------------------
Just run cygwin setup.exe (http://cygwin.com/install.html) and make sure that you have installed g++ 4.8.1 (or greater), cmake, gmp and libmpfr.
We have tested Lean using Cygwin for 64-bit versions of Windows.

Build Instructions
==================

Using [CMake][cmake] + Make
---------------------
Instructions for DEBUG build

    mkdir -p build/debug
    cd build/debug
    cmake -DCMAKE_BUILD_TYPE=DEBUG ../../src
    make

Instructions for RELEASE build

    mkdir -p build/release
    cd build/release
    cmake -DCMAKE_BUILD_TYPE=RELEASE ../../src
    make

Using [CMake][cmake] + [Ninja][ninja]
-------------------------------
[CMake 2.8.11][cmake] supports [Ninja][ninja] build system using
``-G`` option. [Some people report][1] that using [Ninja][ninja] can
reduce the build time, esp when a build is incremental.

[1]: https://plus.google.com/108996039294665965197/posts/SfhrFAhRyyd

Instructions for DEBUG build

    mkdir -p build/debug
    cd build/debug
    cmake -DCMAKE_BUILD_TYPE=DEBUG -G Ninja ../../src
    ninja

Instructions for RELEASE build

    mkdir -p build/release
    cd build/release
    cmake -DCMAKE_BUILD_TYPE=RELEASE -G Ninja ../../src
    ninja

[cmake]: http://www.cmake.org/
[ninja]: http://martine.github.io/ninja/
