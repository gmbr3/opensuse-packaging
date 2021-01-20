my $old_version_number = $ARGV[0];
my $version_number = $ARGV[1];
my $package_ver = $ARGV[1];
cd home:gmbr3:Lua
cd lua$package_ver
rm -rf lua-$old_version_number.tar.gz
rm -rf lua-$old_version_number-tests.tar.gz
wget https://www.lua.org/ftp/lua-$version_number.tar.gz
wget https://www.lua.org/tests/lua-$version_number-tests.tar.gz
sed -e 's-$old_version_number-$version_number-g' -i lua$package_ver.spec
osc ar
osc commit -m "updated lua$package_ver to version $version_number"
