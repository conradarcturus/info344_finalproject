for file in *; do     iconv -f utf-8 -t ascii "$file" > "$file".tmp;     mv -f "$file".tmp "$file"; done
