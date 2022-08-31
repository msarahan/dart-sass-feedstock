#!/usr/bin/env bash
set -ex

if [ "$SUBDIR" == "osx-arm64" ]; then
    # binary repack on Apple Silicon because build machines only support that via
    #     cross compiling right now
    mkdir -p $PREFIX/bin
    cp sass $PREFIX/bin
    cp -r src $PREFIX/bin
else
    dart pub get
    dart compile exe bin/sass.dart -Dversion=$PKG_VERSION -o $PREFIX/bin/sass
fi
