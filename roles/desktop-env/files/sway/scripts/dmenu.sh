#!/bin/bash
function confirm() {
	[ $(echo -e "No\nYes" | dmenu -i -p "$1") == "Yes" ] && bash -c "$2"
}
function logoff() {
	confirm 'Log off?' 'swaymsg exit'
}

function shutdown() {
	confirm 'Shutdown?' 'shutdown -P now'
}

function suspend() {
	confirm 'Suspend?' '~/.config/sway/scripts/lock.sh && systemctl suspend'
}

function random_wallpaper() {
	~/.config/sway/scripts/random-wallpaper.sh ~/Pictures/wallpapers
}

function list_workspaces() {
	swaymsg workspace $(~/.config/sway/scripts/workspaces.py | dmenu)
}

function list_modes(){
	list=$(echo `swaymsg -t get_binding_modes` | sed 's/"//g
		s/,/\n/g
		s/\[//g
		s/\]//g')
		swaymsg mode $(printf "$list"	| dmenu -l `line_count "$list"`)
}

function line_count() {
	count=$(printf "${1// /_}" | wc -l)
	echo $((count+1))
}

list="suspend\nshutdown\nlogoff\nrandom wallpaper\nlist modes\nlist workspaces\n"
count=$(line_count "$list")
if [[ $1 ]] 
then
	$1
	exit
else
	cmd=`printf "$list" | dmenu -l $((count))`
	${cmd// /_}
fi
