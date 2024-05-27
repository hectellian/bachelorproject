#!/bin/bash
./clean.sh .
./clean.sh sections
git add .
git commit -m "$1"
git push