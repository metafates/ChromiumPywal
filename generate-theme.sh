#!/bin/bash

. ~/.cache/wal/colors.sh

DIR=$(dirname "${BASH_SOURCE[0]}")
THEME_DIR="$DIR/GeneratedTheme"

# Converts hex colors into rgb joined with comma
# #fff -> 255, 255, 255
hexToRgb() {
    # Remove '#' character from hex color #fff -> fff
    plain=${1#*#}
    printf "%d, %d, %d" 0x${plain:0:2} 0x${plain:2:2} 0x${plain:4:2}
}

if [ ! -d $THEME_DIR ]; then
    mkdir $THEME_DIR
fi

if [ ! -d "$THEME_DIR/images" ]; then
    mkdir "$THEME_DIR/images"
fi

# Copy wallpaper so it can be used in theme  
wallpaper=${wallpaper// /_} # sanitize path
cp $wallpaper "$THEME_DIR/images/theme_ntp_background_norepeat.png"

# Theme template
cat > "$THEME_DIR/manifest.json" << EOF
{
  "manifest_version": 3,
  "version": "1.0",
  "name": "Pywal Theme",
  "images": {
      "theme_ntp_background" : "images/theme_ntp_background_norepeat.png"
  },
  "theme": {
    "colors": {
      "frame": [$(hexToRgb $background)],
      "frame_inactive": [$(hexToRgb $background)],
      "toolbar": [$(hexToRgb $color11)],
      "ntp_text": [$(hexToRgb $foreground)],
      "ntp_link": [$(hexToRgb $color11)],
      "ntp_section": [$(hexToRgb $color8)],
      "button_background": [$(hexToRgb $foreground)],
      "toolbar_button_icon": [$(hexToRgb $foreground)],
      "toolbar_text": [$(hexToRgb $foreground)],
      "omnibox_background": [$(hexToRgb $background)],
      "omnibox_text": [$(hexToRgb $foreground)]
    },
    "properties": {
      "ntp_background_alignment": "bottom"
    }
  }
}
EOF


# Remove cache so chrome will refresh theme colors on restart
if [ -f "$THEME_DIR/Cached Theme.pak" ]; then
    rm "$THEME_DIR/Cached Theme.pak"
fi

echo "Theme generated at $THEME_DIR"
