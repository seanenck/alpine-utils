#!/bin/sh -e
{
  echo "[image]"
  echo "==="
  echo "-> apkovl: $OVL_FILE"
} > "$1/etc/motd"
