#!/bin/bash

MODS_DIR="$HOME/.minetest/mods"
GIT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MODS=( tnt t_autorepair t_death t_jytky t_megajytky t_repair t_lamps )

for i in "${MODS[@]}"; do
    if [ -d "$GIT_DIR/$i" ] && [ -n "$i" ]; then
	if [ -d "$MODS_DIR/$i" ]; then
	    rm -r "$MODS_DIR/$i";
	fi
	echo "Created a link: $(ln -vfs "$GIT_DIR/$i" "$MODS_DIR/$i")"
    fi
done

