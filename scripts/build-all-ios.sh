#!/bin/sh

pushd "`dirname "$0"`" > /dev/null
scriptpath="`pwd`"
popd > /dev/null

if test "x$ACTION" = xclean ; then
  echo clean mailcode2 static libraries
fi

deps="ctemplate-ios libetpan-ios tidy-html5-ios"
for dep in $deps ; do
	$scriptpath/build-$dep.sh
done

