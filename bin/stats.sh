#!/usr/bin/env bash
if ! git diff-index --quiet HEAD --; then
  echo -e "\nDiff to HEAD: $(./wc-diff.sh)"
else echo 'No changes.'; fi
