#!/bin/bash
LANG=C

# Preventing exports
# https://unix.stackexchange.com/questions/232063/what-is-most-secure-and-simplest-way-to-have-a-user-typed-password-on-bash-becom/232083#232083
unset -v PASS
set +o allexport


# Setup:
DATABASE=${HOME}/temp/kdb/passwd.kdbx
TIMEOUT=10

# Hiding dmenu password
# https://ncoop.github.io/2017/01/02/enter-passwords-from-dmenu
hiddencolor="black"
PASS=$(dmenu -p "Password?" -nf "$hiddencolor" -nb "$hiddencolor" <&-)
keepassxc-cli ls ${DATABASE} <<< ${PASS}
if [ $? -eq 1 ]
then
	notify-send "ERROR: Invalid password."
	exit 1
fi

ENTRY=""

keepassxc-cli ls ${DATABASE} ${ENTRY} <<< ${PASS} || exit 1

while [[ ${ENTRY: -1}  == "/" || ${#ENTRY} == 0 ]]
do
	echo ${ENTRY}
	ITEM=$(keepassxc-cli ls ${DATABASE} ${ENTRY} <<< ${PASS} | tail -n +2 | dmenu -i -l 20 -p $([[ ${#ENTRY} == 0 ]] && echo "root?" || echo ${ENTRY}))
	if [[ ${#ITEM} == 0 ]]
	then
		echo "ERROR"
		exit 2
	fi
	ENTRY=${ENTRY}${ITEM}
done

keepassxc-cli clip ${DATABASE} "${ENTRY}" <<< ${PASS} && notify-send "Password for ${ENTRY} copied to clipboard." || notify-send "Password for ${ENTRY} not found."
[[ -n $TIMEOUT ]] && (
	notify-send "Clearing Clipboard in ${TIMEOUT} seconds..."
	sleep ${TIMEOUT}
	xclip -r -selection Clipboard < /dev/null
	notify-send "Clipboard cleared."
)


