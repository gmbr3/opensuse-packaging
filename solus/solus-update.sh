old_version_number=$1
old_version_trimmed=$2
version_number=$3
cd home:gmbr3:Solus
cd budgie-desktop
rm -rf *+$old_version_trimmed.obscpio
sed -e 's-$old_version_number-$version_number-g' -i _service
osc service manualrun
osc ar
osc commit -m "updated budgie-desktop to version $version_number"
