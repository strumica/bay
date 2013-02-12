#!/bin/bash
# reset Firefox

warn ()
{
  printf '\e[36m%s\e[m\n' "$*"
}

upath ()
{
  cd ${!1}
  read $1 < <(pwd)
  cd ~-
}

upath APPDATA
set $APPDATA mozilla/firefox
rm -r $1/$2
cp -r /opt/dotfiles/mozilla $1
cd $1/$2
