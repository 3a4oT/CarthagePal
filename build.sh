#!/bin/zsh

carthage update --new-resolver --platform iOS &

BACK_PID=$!

while kill -0 $BACK_PID ; do
    echo "Process is still active..."
    sleep 1
done

# cleanup
rm -rf Carthage/Checkouts/
rm -rf Carthage/Build/Mac/
rm -rf Carthage/Build/tvOS/
rm -rf Carthage/Build/watchOS/

# copy resolved file
cp Cartfile.resolved Carthage/

# create artifact
zip -vr Carthage.zip Carthage/ -x "*.DS_Store" -x "__MACOSX"