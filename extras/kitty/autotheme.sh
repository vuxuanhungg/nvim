#!/usr/bin/env bash
# NOTE: Make sure this file is executable

THEME_NAME="$1"
KITTY_DIR="$HOME/.config/kitty"
THEME_FILE="$KITTY_DIR/themes/$THEME_NAME.conf"
AUTO_FILE="$KITTY_DIR/themes/auto.conf"

# Update theme
ln -sf "$THEME_FILE" "$AUTO_FILE"

# Reload config
kitty @ set-colors --all --configured "$AUTO_FILE"
