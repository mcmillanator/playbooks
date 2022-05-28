#! /bin/bash
workspace() {
	swaymsg -q workspace $1
}

app() {
	swaymsg -q exec "$1"
}

start() {
	for i in ${@} 
		do
			if app $i >/dev/null 2>&1
				then
					break
			fi
	done
}

name=$1
shift

# if workspace already exist then switch to it
if swaymsg -t get_workspaces | grep \"name\":\ \"$name\"; then
	workspace $name
# else create the workspace and parse arguments
else
	workspace $name
	while getopts s:a:t: opt; do
		case $opt in
			a)
				app "$OPTARG"
				;;
			s)
				start "$OPTARG"
				;;
		esac
	done
fi
