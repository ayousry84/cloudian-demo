#!/bin/bash

MASTER_PUB_KEY_PATH="/myfiles/master_id_rsa.pub"
AUTHORIZED_KEYS="/root/.ssh/authorized_keys"

mkdir -p /root/.ssh
touch $AUTHORIZED_KEYS
chmod 600 $AUTHORIZED_KEYS
chown root:root $AUTHORIZED_KEYS

if [[ $(hostname) != configuration-master && -f "$MASTER_PUB_KEY_PATH" ]]; then
  if ! grep -q -F "$(cat $MASTER_PUB_KEY_PATH)" "$AUTHORIZED_KEYS"; then
    echo "Injecting master's key into $(hostname)"
    cat "$MASTER_PUB_KEY_PATH" >> "$AUTHORIZED_KEYS"
  fi
fi