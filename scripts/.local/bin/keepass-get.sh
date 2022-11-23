#!/bin/bash
LANG=C

# For debugging
# set -o xtrace

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
PASS=$(dmenu -i -p "Password?" -nf "$hiddencolor" -nb "$hiddencolor" <&-)
keepassxc-cli ls "${DATABASE}" <<< "${PASS}"
if [ $? -eq 1 ]
then
	notify-send "ERROR: Invalid password."
	exit 1
fi

ENTRY=$(dmenu -i -p "Entry?" <&- )

ITEM=$(keepassxc-cli search "${DATABASE}" "${ENTRY}" <<< "${PASS}" 2>&1)
# Cleaning up verbosity from keepassxc
ITEM=$(tail -n 1 <<< "${ITEM}")

if [[ ${ITEM} ==  *"No results"* ]]
then
	notify-send "Entry ${ENTRY} not found."
	exit 1
fi

keepassxc-cli clip ${DATABASE} "${ITEM}" 0 <<< ${PASS} && notify-send "Password for ${ITEM} copied to clipboard."
[[ -n $TIMEOUT ]] && (
	notify-send "Clearing Clipboard in ${TIMEOUT} seconds..."
	sleep ${TIMEOUT}
	xclip -r -selection Clipboard < /dev/null
	notify-send "Clipboard cleared."
)


