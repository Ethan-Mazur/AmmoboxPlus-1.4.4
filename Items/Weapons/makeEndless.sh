#!/bin/bash

rm testing.cs
FILELIST=$(find . | sed s:./::)
for i in $FILELIST; do
    echo "$i"
    if [ "$i" == "applyAll.txt" ]; then
        continue;
    fi
    if [ "$i" == "testing.cs" ]; then
        continue;
    fi
    if [ "$i" == "makeEndless.sh" ]; then
        continue;
    fi
    if [ "$i" == "." ]; then
        continue;
    fi
    CLASSNAME=$(echo "$i" | sed s/Endless// | sed s:.cs::)
    NEWCLASSNAME=$(echo "$i" | sed s:.cs::)
    FILECONTENTS=$(cat "$i")
    FILECONTENTS=$(echo "$FILECONTENTS" | sed s:999:1:)
    PATTERN="class "$CLASSNAME
    REPLACE="class "$NEWCLASSNAME
    FILECONTENTS=$(echo "$FILECONTENTS" | sed s:"$PATTERN":"$REPLACE":)
    FILECONTENTS=$(echo "$FILECONTENTS" | head -n -11)
    TODD=$(cat applyAll.txt | sed s:ITEMCLASSNAME:"$CLASSNAME":)

    grep -s "using Terraria;" $i
    if [ "$?" == "1" ]; then
        FILECONTENTS=$(echo "using Terraria;
        $(echo "$FILECONTENTS")")
    fi

    FILECONTENTS="$FILECONTENTS$TODD"
    echo "$FILECONTENTS" > "$i"
done