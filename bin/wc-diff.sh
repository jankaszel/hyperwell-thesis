#!/bin/bash
REM=`git diff --word-diff=porcelain -U $* | grep '^-' | sed 's/^-//' | wc -w`
ADD=`git diff --word-diff=porcelain -U $* | grep '^+' | sed 's/^+//' | wc -w`
echo `expr $ADD - $REM`
