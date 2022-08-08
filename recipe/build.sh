#!/usr/bin/env bash

if [ "$BUILD_PLATFORM" = "osx-arm64" ]; then
    # binary repack on Apple Silicon because build machines only support that via
    #     cross compiling right now
    mkdir -p $PREFIX/bin
    cp sass $PREFIX/bin
    cp src $PREFIX/bin
else
    dart pub get
    dart compile exe bin/sass.dart -o $PREFIX/bin/sass
fi
