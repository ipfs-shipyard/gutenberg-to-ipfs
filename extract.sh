#!/usr/bin/env bash

set -e

archive=archive
index="cache/epub"
dest=ipfs-archive

mkdir -p $dest

books=`find "$archive" -name '*.zip'`
for b in $books; do
    id=`basename "$b" "-h.zip"`
    path="$index/$id/pg$id.rdf"

    title=`xml_grep --text_only dcterms:title "$path" | head -n 1 | tr -d '\r' | tr -d '\n'`
    author=`xml_grep dcterms:creator "$path"  | xml_grep --text_only pgterms:name | head -n 1 | tr -d '\r' | tr -d '\n'`

    bookdest="ipfs-archive/$id - $title - $author"
    mkdir -p "$bookdest"
    echo "Unzipping book to $bookdest"
    unzip -qq -o -d "$bookdest" $b
    if [ -d "$bookdest/$id-h" ]; then
        mv "$bookdest/$id-h/"* "$bookdest/"
        rmdir "$bookdest/$id-h"
    fi
    if [ -f "$bookdest/$id-h.htm"* ]; then
        mv "$bookdest/$id-h.htm"* "$bookdest/index.html"
    fi
done
