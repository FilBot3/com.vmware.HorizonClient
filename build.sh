#!/bin/bash -e
# Install script for x64

VERSION="2106.1-8.3.1-18435609"

echo "Performing main extract"

MAIN_DIR="MainFiles"
mkdir $MAIN_DIR

tar -xf "VMware-Horizon-Linux.tar.gz" -C $MAIN_DIR --strip-components 1


echo "Extracting client"

tar -xf "$MAIN_DIR/x64/VMware-Horizon-Client-${VERSION}.x64.tar.gz"  -C /app/ --strip-components 1

mkdir -p "/app/share/icons/hicolor/82x82/"
cp "/app/share/icons/vmware-view.png" "/app/share/icons/hicolor/82x82/com.vmware.HorizonClient.png"

cp "/app/share/applications/vmware-view.desktop" "/app/share/applications/com.vmware.HorizonClient.desktop"

sed -i 's/\/usr/\/app/' "/app/bin/vmware-view"
sed -i 's/\/usr/\/app/' "/app/lib/vmware/view/env/env_utils.sh"
sed -i 's/\/usr/\/app/' "/app/lib/vmware/view/dct/vmware-view-log-collector"

echo "Linking"
cd /app/lib/
ln -s libudev.so.1 libudev.so.0
cd

echo "Clean up"
rm -rf "VMware-Horizon-Client-Linux-${VERSION}"*

echo "Complete"
