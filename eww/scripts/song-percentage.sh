#!/bin/env bash

SONG_LENGTH=$(playerctl metadata -fs '{{mpris:length}}')
SONG_POSITION=$(playerctl -s position)

if [[ "$SONG_LENGTH" == '' || "$SONG_POSITION" == '' ]]; then
	echo "0"
	sleep 0.5
	return
fi

bc -l <<< "$SONG_POSITION / ($SONG_LENGTH/100000000)"
