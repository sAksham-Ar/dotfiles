#!/bin/bash
awk -v m="$2" '
    (NR==1){h=$0;next}
    (NR%m==2) { close(f); f=sprintf("%0.5d.%s",++c,FILENAME); print h > f }
    {print > f}' "$1"
