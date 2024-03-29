#!/bin/bash

the_fonts_dir=$(pwd)
echo "the_fonts_dir: $the_fonts_dir"

find_command="find \"$the_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.[o,t]tc' -or -name '*.pcf.gz' \) -type f -print0"

if [[ `uname` == 'Darwin' ]]; then
  # Works on MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Works on Linux
  font_dir="$HOME/.local/share/fonts"
  mkdir -p $font_dir
fi

echo -e "Run: $find_command | xargs -0 -I % cp \"%\" \"$font_dir/\"\n"

# Copy all fonts to user fonts directory
echo "Copying fonts..."
# printing
eval $find_command | xargs -0 -I %

eval $find_command | xargs -0 -I % cp "%" "$font_dir/"

# Reset font cache on Linux
if command -v fc-cache @>/dev/null ; then
  echo -e "\nResetting font cache, this may take a moment..."
  fc-cache -f $font_dir
fi