#!/usr/bin/env bash
# Installs kind so the whole stack can run inside a Codespace.
set -euo pipefail

curl -sSLo /tmp/kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
sudo install -m 0755 /tmp/kind /usr/local/bin/kind

cp -n k8s/base/rabbitmq.env.example k8s/base/rabbitmq.env || true

echo "Ready. Try:"
echo "  kind create cluster"
echo "  kubectl apply -k k8s/overlays/dev"
