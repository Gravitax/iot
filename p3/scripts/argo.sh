k3d cluster delete -a
k3d cluster create my-cluster --api-port 6443 -p 8080:80@loadbalancer -p 8443:443@loadbalancer -p 8888:8888@loadbalancer --agents 2
kubectl create namespace argocd
kubectl apply -n argocd -f ./confs/argoInstall.yaml
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData":  {
    "admin.password": "$2y$12$Kg4H0rLL/RVrWUVhj6ykeO3Ei/YqbGaqp.jAtzzUSJdYWT6LUh/n6",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
kubectl apply -n argocd -f ./confs/ingress.yaml
kubectl create namespace dev
kubectl apply -n argocd -f ./confs/appProject.yaml
kubectl apply -n argocd -f ./confs/application.yaml
