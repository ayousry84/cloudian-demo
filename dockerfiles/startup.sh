#!/bin/bash

echo '[ -f /etc/profile ] && source /etc/profile' >> ~/.bashrc
echo '[ -f ~/.bash_profile ] && source ~/.bash_profile' >> ~/.bashrc

/usr/local/bin/inject_keys.sh

echo "Welcome to $(hostname)"

exec /usr/sbin/sshd -D
