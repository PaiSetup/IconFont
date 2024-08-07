#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
extract_dir="$(mktemp -d)"

# Unzip
zip_file=~/downloads/icomoon-v1.0.zip
unzip "$zip_file" -d "$extract_dir"

# Copy ttf to repository
src_ttf_path="$extract_dir/fonts/icomoon.ttf"
dst_ttf_path="$script_dir/pai_setup_icon_font.ttf"
cp "$src_ttf_path" "$dst_ttf_path"

# Cleanup
rm -rf "$extract_dir"