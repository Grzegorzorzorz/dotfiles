if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty8 ]]; then
	clear
	export SVDIR=$HOME/.local/service
	#exec $HOME/.local/bin/start-hyprland
	exec /usr/bin/start-hyprland
fi
