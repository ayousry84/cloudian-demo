#!/bin/bash

/usr/local/bin/inject_keys.sh

echo "Welcome to $(hostname)"

exec /usr/sbin/sshd -D