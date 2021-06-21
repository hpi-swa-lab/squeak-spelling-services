#!/bin/bash

git clone --depth 1 https://gitlab.com/vigou3/emacs-modified-windows.git
realpath emacs-modified-windows/aspell/bin/aspell.exe > ./where-is-ispell.txt

# DEBUG
ls -la
