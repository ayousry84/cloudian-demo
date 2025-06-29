#!/bin/bash

sudo echo '[ -f /etc/profile ] && sudo source /etc/profile' >> /root/.bashrc
sudo echo '[ -f ~/.bash_profile ] && sudo source ~/.bash_profile' >> /root/.bashrc

/usr/local/bin/inject_keys.sh

echo "Welcome to $(hostname)"

exec /usr/sbin/sshd -D
