#!/bin/bash

source $HOME/.path

focusedws=$(hyprctl activewindow -j | gojq -c -M '.workspace.id')
echo $focusedws

if [[ "$focusedws" == 'null' ]]; then
  echo 1
fi

if [ "$1" == "--once" ]; then
  exit 0
else
  socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | grep --line-buffered "workspace>>" | while read -r line; do
    case ${line%>>*} in
      "workspace")
        focusedws=${line#*>>}
        echo $focusedws
        ;;
    esac  
  done
fi
