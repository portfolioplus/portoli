#!/bin/bash
tar -czvf setup.tar.gz setup/README.md setup/ios/GoogleService-Info.plist setup/android/key.properties setup/android/app/google-services.json setup/keystore/debug.keystore setup/keystore/release.keystore
travis encrypt-file setup.tar.gz --org --force