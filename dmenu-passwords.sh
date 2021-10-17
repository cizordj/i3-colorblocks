#!/bin/sh
PROMPT="$(pass list | dmenu -l 20)"
[ $? -eq 1 ] && exit 0
PASSWORD="$(echo $PROMPT | sed -e 's/^.* //g')"
pass -c "$PASSWORD"
notify-send "Senha copiada para a área de transferência"
unset PROMPT
unset PASSWORD
