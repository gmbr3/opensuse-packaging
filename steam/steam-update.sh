my $old_version_number = $ARGV[0];
my $version_number = $ARGV[1];
cd home:gmbr3:Steam
cd steam
rm -rf steam-$old_version_number.tar.xz
wget https://repo.steampowered.com/steam/pool/steam/s/steam/steam_$version_number.tar.xz
sed -e 's-$old_version_number-$version_number-g' -i steam.spec
osc ar
osc commit -m "updated steam to version $version_number"
