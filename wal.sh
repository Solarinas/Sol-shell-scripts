#!/bin/bash

wal -i "$1"
wal_steam -w
~/.local/bin/genzathurarc > ~/.config/zathura/zathurarc
cp ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/config.rasi
