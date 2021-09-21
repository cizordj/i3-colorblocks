#!/bin/sh
CONFIG_PATH="$HOME/.config/i3"
CONFIG_FILE="$CONFIG_PATH/config"
COLORBLOCKS_URL="git@github.com:cizordj/colorblocks.git"
POLYBAR_PATH="$HOME/.config/polybar"
DUNSTRC_PATH="$HOME/.config/dunst"
DUNST_CONFIG_FILE="$DUNSTRC_PATH/dunstrc"
[ -d $CONFIG_PATH ] || mkdir $CONFIG_PATH
sh "i3-config.sh" > "$CONFIG_FILE"
[ -d $POLYBAR_PATH ] || mkdir $POLYBAR_PATH
cd "$POLYBAR_PATH"
IT_IS_GIT_REPOSITORY=$(git remote -v | head -n1 | tr -d '\t' | sed -e 's/origin//g' -e 's/[[:space:]](fetch)//g')

[ $IT_IS_GIT_REPOSITORY != $COLORBLOCKS_URL] && {
    rm -rf *
    cd ..
    git clone "$COLORBLOCKS_URL" "$POLYBAR_PATH"
}
cd "$OLDPWD"

[ -d $DUNSTRC_PATH ] || mkdir $DUNSTRC_PATH
sh "dunstrc.sh" > $DUNST_CONFIG_FILE

i3-msg restart
