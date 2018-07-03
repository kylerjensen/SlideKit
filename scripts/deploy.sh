#!/bin/bash

VERSION=$1
PODSPEC="JazzySlideKit.podspec"

scripts/version_pre_deploy.sh $VERSION $PODSPEC

set -e
pod trunk push $PODSPEC

scripts/version_post_deploy.sh $PODSPEC