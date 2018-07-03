#!/bin/bash

set -e

VERSION=$1
PODSPEC=$2

podspec-bump -w -p $PODSPEC -i $VERSION
pod trunk push $PODSPEC
