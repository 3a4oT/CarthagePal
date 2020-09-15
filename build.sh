#!/bin/zsh

carthage update --new-resolver --platform iOS

# cleanup
rm -rf Carthage/Checkouts/
rm -rf Carthage/Build/macOS/
rm -rf Carthage/Build/tvOS/
rm -rf Carthage/Build/watchOS/

# copy resolved file
cp Cartfile.resolved Carthage/

# create artifact
zip -vr Carthage.zip Carthage/ -x "*.DS_Store" -x "__MACOSX"