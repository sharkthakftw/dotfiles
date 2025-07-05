#!/bin/sh
sed -i \
         -e 's/#1a1b1f/rgb(0%,0%,0%)/g' \
         -e 's/#dadbdd/rgb(100%,100%,100%)/g' \
    -e 's/#1a1b1f/rgb(50%,0%,0%)/g' \
     -e 's/#c75465/rgb(0%,50%,0%)/g' \
     -e 's/#1a1b1f/rgb(50%,0%,50%)/g' \
     -e 's/#dadbdd/rgb(0%,0%,50%)/g' \
	"$@"
