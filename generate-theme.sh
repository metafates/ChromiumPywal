#!/bin/bash

. ~/.cache/wal/colors.sh

THEME_PATH="$HOME/Chromium Extensions/pywaltheme"

hexToRgb() {
    # Remove '#' character from hex color #fff -> fff
    plain=${1#*#}
    printf "%d, %d, %d" 0x${plain:0:2} 0x${plain:2:2} 0x${plain:4:2}
}

cat > "$THEME_PATH/manifest.json" << EOF
{
  "manifest_version": 3,
  "version": "1.0",
  "name": "pywal theme",
  "theme": {
    "colors" : {
      "frame" : [$(hexToRgb $background)],
      "frame_inactive": [$(hexToRgb $background)],
      "toolbar" : [$(hexToRgb $color11)],
      "ntp_text" : [$(hexToRgb $foreground)],
      "ntp_link" : [$(hexToRgb $color11)],
      "ntp_section" : [$(hexToRgb $color8)],
      "button_background" : [$(hexToRgb $foreground)],
      "toolbar_button_icon" : [$(hexToRgb $foreground)],
      "toolbar_text": [$(hexToRgb $foreground)],
      "omnibox_background": [$(hexToRgb $background)],
      "omnibox_text": [$(hexToRgb $foreground)]
    },
    "properties" : {
      "ntp_background_alignment" : "bottom"
    }
  }
}
EOF
