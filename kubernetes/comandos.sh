kind create cluster # Criar um cluster
kubectl cluster-info --context kind-kind # Definir contexto do kubectl apontando para o kind

kubectl get all # Listar todos os clusters
kubectl get nodes # Listar todos os nodes
kubectl get pods # Listar todos os pods

kubectl apply -f pod.yaml # Instanciar o pod

kubectl port-forward pod/nginx 8000:80 # Apontar a porta 8000 do PC para 80 do POD
kubectl delete pod nginx # Deletar o POD

kubectl apply -f .\rs.yaml # Instanciar o ReplicaSet

kubectl get rs # Listar todos os ReplicaSet

kubectl apply -f .\deploy.yaml # Instanciar o Deployment

kubectl get deploy # Listar todos os Deployments
