#!/bin/bash

PODSPEC=$1

set -e
podspec-bump -w -p $PODSPEC
git add $PODSPEC
git commit -m "[Travis-CI] Setting version of $PODSPEC to $(podspec-bump --dump-version) [Post-Deploy]" $PODSPEC
git push origin