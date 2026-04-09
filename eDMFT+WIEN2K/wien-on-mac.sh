#!/bin/bash

find . -name Makefile -print0 |
while IFS= read -r -d '' i; do
  sed -i.bak 's/\([^[:alpha:]]\)rm\([[:space:]]\)/\1echo rm\2/g' "$i"
done
