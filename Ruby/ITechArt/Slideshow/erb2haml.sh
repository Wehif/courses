#!/usr/bin/env bash
find . -name \*.erb -print | sed 'p;s/.erb$/.haml/' | xargs -n2 html2haml