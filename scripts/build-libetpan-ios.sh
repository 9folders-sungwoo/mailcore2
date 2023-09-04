#!/bin/sh

pushd "`dirname "$0"`" > /dev/null
scriptpath="`pwd`"
popd > /dev/null

. "$scriptpath/include.sh/build-dep-9.sh"

url="https://github.com/dinhvh/libetpan.git"
rev="5c9eb6b6ba64c4eb927d7a902317410181aacbba"
patch_file="$scriptpath/sasl-build.patch"
name="libetpan-ios"
xcode_target="libetpan ios"
xcode_project="libetpan.xcodeproj"
library="libetpan-ios.a"
embedded_deps="libsasl-ios"

build_git_ios
