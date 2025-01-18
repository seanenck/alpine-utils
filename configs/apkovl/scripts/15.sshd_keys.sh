#!/bin/sh -e
mkdir -p "$1/etc/ssh"
for TYPE in ecdsa ed25519 rsa; do
  ssh-keygen \
    -q \
    -f "$1/etc/ssh/ssh_host_${TYPE}_key" \
    -N '' \
    -t "$TYPE"
done
