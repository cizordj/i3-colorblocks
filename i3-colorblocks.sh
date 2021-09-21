#!/bin/sh
CONFIG_PATH="$HOME/.config/i3"
CONFIG_FILE="$CONFIG_PATH/config"
COLORBLOCKS_URL="git@github.com:cizordj/colorblocks.git"
POLYBAR_PATH="$HOME/.config/polybar"
DUNSTRC_PATH="$HOME/.config/dunst"
DUNST_CONFIG_FILE="$DUNSTRC_PATH/dunstrc"
[ -d $CONFIG_PATH ] || mkdir $CONFIG_PATH
source "$PWD/i3-config.sh"
printi3Config > "$CONFIG_FILE"
[ -d $POLYBAR_PATH ] || mkdir $POLYBAR_PATH
cd "$POLYBAR_PATH"
rm -rf *
git clone "$COLORBLOCKS_URL"
[ -d $DUNSTRC_PATH ] || mkdir $DUNSTRC_PATH
source "$PWD/dunstrc.sh"
printDunstRc > $DUNST_CONFIG_FILE

i3-msg restart
