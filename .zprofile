if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	clear
	exec $HOME/.local/bin/start-hyprland &> /dev/null
	sleep 1
fi
