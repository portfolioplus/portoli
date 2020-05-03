#!/bin/bash

{
    rm -rf android
    rm -rf osx
    flutter clean
    flutter create .

    cp setup/ios/GoogleService-Info.plist ios/Runner/GoogleService-Info.plist

    flutter pub get
    flutter pub run flutter_launcher_icons:main

    flutter -v build ios --no-codesign --release
    mkdir -p build/ios/iphoneos/Payload
    mv build/ios/iphoneos/Runner.app build/ios/iphoneos/Payload/Runner.app
    zip -r -9 "portoli.ipa" "build/ios/iphoneos/Payload"
}
