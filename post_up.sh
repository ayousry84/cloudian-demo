#!/bin/bash

until docker exec configuration-master test -f /root/.ssh/id_rsa.pub; do
  echo "Waiting for master's SSH key to be ready..."
  sleep 2
done

docker cp configuration-master:/root/.ssh/id_rsa.pub ./myfiles/master_id_rsa.pub

NODES=(node1 node2 node3)

for NODE in "${NODES[@]}"; do
  echo "Injecting public key into $NODE..."
  docker exec "$NODE" bash -c "/usr/local/bin/inject_keys.sh"
done

echo "✅ SSH trust has been established from configuration-master to all nodes."