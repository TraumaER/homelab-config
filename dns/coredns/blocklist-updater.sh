#!/usr/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
temp_dir=$(mktemp -d)

downloadedList="$temp_dir/list.stevenblack.unified"
cleanedList="$temp_dir/list.stevenblack.unified.cleaned"
finalList="$script_dir/hosts.blocklist"

wget -O $downloadedList --header 'accept: test/plain' https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

cat $downloadedList | rg '^0.0.0.0' > $cleanedList

echo >> $cleanedList

sort -u $cleanedList > $finalList