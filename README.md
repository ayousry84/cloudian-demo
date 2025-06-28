# RockyLinux Dev Cluster

This repository contains a Docker-based RockyLinux cluster with one configuration-master node and multiple worker nodes. It enables SSH-based orchestration between nodes for learning, testing, or development environments.

## 🧰 Features
- Pre-configured SSH access
- RockyLinux 8 with x86_64 emulation for Apple Silicon
- Master node public key auto-injected into all worker nodes
- Simple one-command setup using `make`

## 🚀 Getting Started

### Prerequisites
- Docker
- Docker Compose
- GNU Make

### Clone and Start
```bash
git clone <your-repo-url>
cd rockylinux-cluster
make up
```

### Available Commands
```bash
make up           # Build and start the cluster
make down         # Stop and remove the cluster
make rebuild      # Rebuild the images and restart everything
make logs         # Follow container logs
make ssh-master   # SSH into the configuration-master node
```

## 🔐 SSH Access
- Master node password: `password123`
- After `make up`, the master can SSH into all nodes without password

## 📁 Structure
See `project_structure.md` for full directory structure.

## 🧪 Notes
- Master node is distinct: generates SSH key and distributes it
- Nodes inject master key only if hostname != configuration-master
- Persistent shared volume `/myfiles` is mounted for key sharing

---

Made with ❤️ for DevOps bootstrapping