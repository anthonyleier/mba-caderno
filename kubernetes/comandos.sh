# Kubernetes

# Clusters e Nodes
kind create cluster # Criar um cluster
kubectl cluster-info --context kind-kind # Definir contexto do kubectl apontando para o kind
kubectl get all # Listar todos os clusters
kubectl get nodes # Listar todos os nodes

# Pods
# Pods encapsulam um ou mais containers, porém é recomendado encapsular apenas um por pod
kubectl get pods # Listar todos os pods
kubectl apply -f pod.yaml # Instanciar o pod
kubectl port-forward pod/nginx 8000:80 # Apontar a porta 8000 do PC para 80 do POD
kubectl delete pod nginx # Deletar o POD

# ReplicaSets
## ReplicaSets são controladores que garantem um número específico de réplicas de um determinado pod
kubectl get rs # Listar todos os ReplicaSets
kubectl apply -f .\kubernetes\rs.yaml # Instanciar o ReplicaSet
kubectl delete rs nginx-rs # Deletar o ReplicaSet

# Deployments
# Deployments controlam a atualização das aplicações, atualizando os ReplicaSet conforme o possível
kubectl get deploy # Listar todos os Deployments
kubectl apply -f .\kubernetes\deploy.yaml # Instanciar o Deployment
kubectl delete deploy nginx-deploy # Deletar o Deployment

# Services
# Services são portas de entradas para o pod, direciona o usuário para o melhor pod possível, atua como LoadBalancer
kubectl get services # Listar todos os Services
kubectl apply -f .\kubernetes\service.yaml # Instanciar o Service
kubectl port-forward service/nginx-service 8000:80 # Apontar a porta 8000 do PC para 80 do Service que direcionará para a 80 dos pods
kubectl delete services nginx-service # Deletar o Service
