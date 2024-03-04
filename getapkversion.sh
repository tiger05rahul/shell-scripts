#!/bin/bash

# Define an array of package names



package_names=("tv.cloudwalker.oobe" "tv.cloudwalker.inputserver" "tv.cloudwalker.apps" "tv.cloudwalker.skin" "tv.cloudwalker.profile" "tv.cloudwalker.updater" "tv.cloudwalker.apiservice" "tv.cloudwalker.channels" "tv.cloudwalker.cwnxt.launcher.com" "tv.cloudwalker.market" "tv.cloudwalker.cloudwalkeruniverse" "tv.cloudwalker.player" "tv.cloudwalker.search" "tv.cloudwalker.voice")

# Loop through the array and get version information for each package
for package_name in "${package_names[@]}"; do
    # Get the version information using adb shell and dumpsys
    version_info=$(adb shell dumpsys package $package_name | grep version)

    # Extract the version number from the information
    version_number=$(echo "$version_info" | grep -oP 'versionName=\K[^ ]+')

    # Print the result
    echo "Package: $package_name"
    echo "Version: $version_number"
    echo " "
done

