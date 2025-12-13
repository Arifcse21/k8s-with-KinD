# Step 1: Install the dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# Step 2: Create the admin user (authentication)
kubectl apply -f dashboard-service-account.yml
kubectl apply -f cluster-role-binding.yml

# Step 3: Make it accessible from your browser (network access)
kubectl apply -f dashboard-service-nodeport.yml

# Step 4: Get the login token
kubectl -n kubernetes-dashboard create token admin-user

# Step 5: Open your browser
# Go to: https://localhost:30443
# Paste the token from step 4
```

## Your File Structure Should Be:
```
dashboard/
├── dashboard-service-account.yml      (Who can login)
├── cluster-role-binding.yml           (What permissions they have)
└── dashboard-service-nodeport.yml     (How to access from browser)
```

## Think of it Like This:
```
┌─────────────────────────────────────────┐
│  Dashboard Pod (running in cluster)    │
│  - Needs authentication to login       │
│  - Needs network access to reach it    │
└─────────────────────────────────────────┘
         ↑                    ↑
         │                    │
    Authentication         Network Access
         │                    │
   ┌─────┴─────┐         ┌────┴────┐
   │ Service   │         │ Service │
   │ Account + │         │ Type:   │
   │ Role      │         │ NodePort│
   │ Binding   │         └─────────┘
   └───────────┘