#/bin/bash

files=$(find . -type f -name "docker-compose.yml")

for file in $files; do
  # Need to use awk to preserve blank lines while sorting keys with yq because of https://github.com/mikefarah/yq/issues/1834
  formatted=$(yq -P 'sort_keys(..)' "$file" | awk 'NR>1 && /^[^ ]/ && !/^---/{print ""} {print}')
  echo "$formatted" > "$file"
done
