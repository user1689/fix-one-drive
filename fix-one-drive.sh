#!/bin/bash

set -eu

APP_NAME="OneDrive"
APP_PATH="/Applications/$APP_NAME.app"
OLD_VERSION="23.054.0313"
PATH_TO_PKG=""
LOCAL_INSTALLER_PATH="$PATH_TO_PKG/OneDrive.pkg"

if [ -e "$APP_PATH" ]; then
    CURRENT_VERSION=$(defaults read /Applications/$APP_NAME.app/Contents/Info.plist CFBundleShortVersionString)
else
    CURRENT_VERSION="x.x.x"
fi

if [ "$OLD_VERSION" != "$CURRENT_VERSION" ]; then

    # Uninstall the current application using sudo
    echo "Uninstalling $APP_NAME..."
    sudo rm -rf "/Applications/$APP_NAME.app"

    # Install the new application using sudo
    echo "Installing the older version of $APP_NAME..."
    sudo installer -pkg "$LOCAL_INSTALLER_PATH" -target /
else
    echo "Version of OneDrive now is $CURRENT_VERSION"
fi
