# Get the token
```bash
kubectl -n kubernetes-dashboard create token admin-user
```

# Create the secret
```bash
kubectl create secret generic kubernetes-dashboard-token -n kubernetes-dashboard --from-literal=token=$(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
```

# Port forward
```bash
kubectl port-forward -n kubernetes-dashboard svc/kubernetes-dashboard 8443:443
```