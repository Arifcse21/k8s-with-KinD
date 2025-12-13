# Install k3s with Docker as the container runtime (instead of containerd)
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--docker" sh -

# Or if you want to keep containerd but still access Docker daemon:
curl -sfL https://get.k3s.io | sh -

# Set up kubeconfig
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config
chmod 600 ~/.kube/config