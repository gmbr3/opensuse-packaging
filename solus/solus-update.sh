my $old_version_number = $ARGV[0];
my $old_version_trimmed = $ARGV[1];
my $version_number = $ARGV[2];
cd home:gmbr3:Solus
cd budgie-desktop
rm -rf *+$old_version_trimmed.obscpio
sed -e 's-$old_version_number-$version_number-g' -i _service
osc service manualrun
osc ar
osc commit -m "updated budgie-desktop to version $version_number"
