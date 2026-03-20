#!/bin/bash
if [ -z $1 ]; then
	exit -1
fi

INAME="Items/Weapons/$1.png"
PNAME="Projectiles/$1.png"

cp "dummy.png" "$INAME"
cp "dummy.png" "$PNAME"