old_version_number=$1
version_number=$2
cd home:gmbr3:Chromium
cd chromium
rm -rf chromium-$old_version_number.tar.xz
wget https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$version_number.tar.xz
sed -e 's-$old_version_number-$version_number-g' -i chromium.spec
osc ar
osc commit -m "updated chromium to version $version_number"
