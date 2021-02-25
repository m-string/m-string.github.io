#!/bin/bash

ROOT=essays
OUTPUT="index.html"

i=0
echo "<!doctype html>" > $OUTPUT
echo "<html>" >> $OUTPUT
echo "    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>" >> $OUTPUT
echo "    <head>" >> $OUTPUT
echo "        <title>姜棚组智</title>" >> $OUTPUT
echo "    </head>" >> $OUTPUT
echo "    <body>" >> $OUTPUT

echo "        <ul>" >> $OUTPUT
for i in `find "$ROOT" -type f -name '*.html' -exec bash -c ' 
	for file do
		echo "${file// /%20}"
	done
	' exec-bash {} +`; do

	path_ext_space="${i//%20/ }"

	base=`basename "$i"`
	base_noext="${base%.*}"
	base_noext_space="${base_noext//%20/ }"

    echo "           <li>" >> $OUTPUT
    echo "               <a href=\"./$path_ext_space\">${base_noext_space}</a></li>" >> $OUTPUT
    echo "           </li>" >> $OUTPUT
done
echo "        </ul>" >> $OUTPUT
echo "    </body>" >> $OUTPUT
echo "</html>" >> $OUTPUT
