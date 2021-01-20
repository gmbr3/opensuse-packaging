old_version_number=$1
version_number=$2
chrome_version_number=$3
cd home:gmbr3:Chromium
cd brave-browser
rm brave-browser-$old_version_number-patches.tar.xz
rm brave-browser-$old_version_number.tar.xz
mkdir brave-browser-$version_number
cd brave-browser-$version_number
git clone https://chromium.googlesource.com/chromium/src.git -b $chrome_version_number --depth 1
cd src
mkdir brave
cd brave
git clone https://github.com/brave/brave-core.git -b v$version_number  --depth 1 .
mv patches brave-browser-$version_number-patches
tar cJf brave-browser-$version_number-patches.tar.xz brave-browser-$version_number-patches
mv brave-browser-$version_number-patches.tar.xz ../../../brave-browser-$version_number-patches.tar.xz
rm -rf brave-browser-$version_number-patches
cd ../../..
tar cJf brave-browser-$version_number.tar.xz brave-browser-$version_number
rm -rf brave-browser-$version_number
osc ar
osc commit -m "updated brave-browser to version $version_number"
