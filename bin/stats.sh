#!/usr/bin/env bash
wc -w ../chapters/*.md

if ! git diff-index --quiet HEAD --; then
  echo -e "\nWords diff to HEAD: $(./wc-diff.sh)"
fi

