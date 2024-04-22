# Instalar mysql com helm
helm install mysql-server oci://registry-1.docker.io/bitnamicharts/mysql

# Definir a senha do usuário root
MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace default mysql-server -o jsonpath="{.data.mysql-root-password}" | base64 -d)

# Criar pod com client caso não tenha o mysql-cli instalado
kubectl run mysql-server-client --rm --tty -i --restart='Never' --image  docker.io/bitnami/mysql:8.0.36-debian-12-r10 --namespace default --env MYSQL_ROOT_PASSWORD=ODMvGppuHi --command -- bash

# Conectar com o server do mysql
mysql -h mysql-server.default.svc.cluster.local -uroot -p"ODMvGppuHi"
