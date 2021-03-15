#!/bin/zsh

set -euo pipefail

# Build dependencies
carthage update --use-xcframeworks

if [ $? != 0 ]; then
  echo ""
  echo "Failed to build with Carthage"
  echo ""
  exit 1
fi

# copy resolved file
cp Cartfile.resolved Carthage/

# cleanup
rm -rf Carthage/Checkouts/
rm -rf Carthage/Build/Mac/
rm -rf Carthage/Build/tvOS/
rm -rf Carthage/Build/watchOS/

# create artifact and filter unnessesary folders.
zip -vr Carthage.zip Carthage/ -x "*.DS_Store" -x "__MACOSX"