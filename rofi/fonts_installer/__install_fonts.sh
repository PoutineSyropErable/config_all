#!/bin/bash

# Font installer script
# Creates a directory, installs fonts, and updates the font cache.

# Variables
FONT_DIR="$HOME/.local/share/fonts"
SCRIPT_DIR="$HOME/font_installer"
SCRIPT_NAME="install_fonts.sh"

# Fonts to install
FONTS=(
    "GrapeNuts-Regular.ttf"
    "Icomoon-Feather.ttf"
    "Iosevka-Nerd-Font-Complete.ttf"
    "JetBrains-Mono-Nerd-Font-Complete.ttf"
)

# Step 1: Create a directory for the script and fonts
mkdir -p "$SCRIPT_DIR"
echo "Created script directory: $SCRIPT_DIR"

# Step 2: Copy the script into the directory
if [ ! -f "$SCRIPT_DIR/$SCRIPT_NAME" ]; then
    cp "$0" "$SCRIPT_DIR/$SCRIPT_NAME"
    echo "Copied the script to $SCRIPT_DIR/$SCRIPT_NAME"
fi

# Step 3: Install fonts
mkdir -p "$FONT_DIR"
echo "Installing fonts to $FONT_DIR..."

for FONT in "${FONTS[@]}"; do
    if [ -f "$FONT" ]; then
        cp "$FONT" "$FONT_DIR/"
        echo "Installed $FONT"
    else
        echo "Font file not found: $FONT"
    fi
done

# Step 4: Update font cache
echo "Updating font cache..."
fc-cache -fv "$FONT_DIR"

# Step 5: Completion message
echo "Fonts installed successfully! Fonts directory: $FONT_DIR"
echo "Script saved in: $SCRIPT_DIR/$SCRIPT_NAME"
