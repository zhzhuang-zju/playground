#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Common variable definitions
kind_version=v0.17.0
host_cluster_ip=172.30.1.2  # host node where Karmada is located
member_cluster_ip=172.30.2.2
local_ip=127.0.0.1
KUBECONFIG_PATH=${KUBECONFIG_PATH:-"${HOME}/.kube"}

# Install Kind binary
function installKind() {
    cat << EOF > installKind.sh
    wget https://github.com/kubernetes-sigs/kind/releases/download/${kind_version}/kind-linux-amd64
    chmod +x kind-linux-amd64
    sudo mv kind-linux-amd64 /usr/local/bin/kind
EOF
}