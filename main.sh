#!/bin/sh
CONFIG_PATH="$HOME/.config/i3"
CONFIG_FILE="$CONFIG_PATH/config"
COLORBLOCKS_URL="git@github.com:cizordj/colorblocks.git"
POLYBAR_PATH="$HOME/.config/polybar"
DUNSTRC_PATH="$HOME/.config/dunst"
DUNST_CONFIG_FILE="$DUNSTRC_PATH/dunstrc"
XWALLPAPER_PATH="$HOME/.config/xwallpaper"
LOCAL_BIN_DIR="$HOME/.local/bin"
DMENU_PASSWORDS_FILE="$HOME/.local/bin/dmenu-passwords.sh"
[ -d $CONFIG_PATH ] || mkdir $CONFIG_PATH
sh "i3-config.sh" > "$CONFIG_FILE"
[ -d $POLYBAR_PATH ] || mkdir $POLYBAR_PATH
cd "$POLYBAR_PATH"
[ -d "$POLYBAR_PATH/.git" ] && {
    IT_IS_GIT_REPOSITORY=$(git remote -v | head -n1 | tr -d '\t' | sed -e 's/origin//g' -e 's/[[:space:]](fetch)//g')
    [ $IT_IS_GIT_REPOSITORY != $COLORBLOCKS_URL ] && {
        rm -rf *
    }
}
git clone "$COLORBLOCKS_URL" "$POLYBAR_PATH" 2> /dev/null
cd "$OLDPWD"

[ -d $DUNSTRC_PATH ] || mkdir $DUNSTRC_PATH
sh "dunstrc.sh" > $DUNST_CONFIG_FILE

[ -d $XWALLPAPER_PATH ] || mkdir "$XWALLPAPER_PATH"

[ -d $LOCAL_BIN_DIR ] || mkdir "$LOCAL_BIN_DIR"

[ -e $DMENU_PASSWORDS_FILE ] || cp "$(basename $DMENU_PASSWORDS_FILE)" "$DMENU_PASSWORDS_FILE"

i3-msg restart
