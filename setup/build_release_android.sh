#!/bin/bash

{
    rm -rf android
    rm -rf osx
    flutter clean
    flutter create --androidx .

    rsync -a setup/android/ android

    flutter pub get
    flutter pub run flutter_launcher_icons:main

    flutter build apk --release
}
