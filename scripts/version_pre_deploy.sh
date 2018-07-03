#!/bin/bash

VERSION=$1
PODSPEC=$2

set +e
git tag --delete $VERSION
git push --delete origin $VERSION
set -e
podspec-bump -w -p $PODSPEC -i $VERSION
set +e
git add $PODSPEC
git commit -m "[Travis-CI] Setting version of $PODSPEC to $VERSION [Pre-Deploy]" $PODSPEC
set -e
git tag $VERSION
git push origin
git push origin $VERSION