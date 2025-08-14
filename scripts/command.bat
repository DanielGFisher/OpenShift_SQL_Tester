1 - login using token
oc login --token=sha256~M7tthHKFACHHpRZEgFP6pnuoE

[DISPLAY RESULT]
Logged into "https://api.rm2.thpm.p1.openshiftapps.com:6443" as "daniel-g-fisher" using the token provided.

You have access to the following projects and can switch between them with 'oc project <projectname>':

  * daniel-g-fisher-dev
    openshift-virtualization-os-images

Using project "daniel-g-fisher-dev".


2 - check user
oc whoami

[DISPLAY RESULT]
daniel-g-fisher


3 - check if there are projects
oc get projects

[DISPLAY RESULT]
NAME                                 DISPLAY NAME          STATUS
daniel-g-fisher-dev                  daniel-g-fisher-dev   Active
openshift-virtualization-os-images                         Active


PVC:
oc apply -f https://raw.githubusercontent.com/DanielGFisher/OpenShift_SQL_Tester/main/infrastructure/k8s/mysql-pvc.yaml

MySQL:
oc new-app mysql:8.0 -e MYSQL_ROOT_PASSWORD=rootpassword -e MYSQL_DATABASE=testdb
oc expose svc/mysql --port=3306 --name=mysql-service

GitHub:
oc new-app https://github.com/DanielGFisher/OpenShift_SQL_Tester.git --name=sql-tester --env="MYSQL_HOST=mysql-service" --env="MYSQL_PORT=3306" --env="MYSQL_USER=root" --env="MYSQL_PASSWORD=rootpassword" --env="MYSQL_DATABASE=testdb"

oc expose deployment/sql-tester --port=8080 --target-port=8080 --name=sql-tester

oc expose svc/sql-tester
oc get route sql-tester

pvc.yaml:
oc get pvc mysql-pvc -n daniel-g-fisher -o yaml

mysqldpl.yaml:
oc get deploy mysql-deployment -n daniel-g-fisher -o yaml

mysqlservice.yaml:
oc get svc mysql-service -n daniel-g-fisher -o yaml

verify:
oc get pods
oc get pvc
oc get svc
oc get route

Deploy to DockerHub:
docker build -t danielgevafisher/fastapi-mysql:latest .
docker push danielgevafisher/fastapi-mysql:latest

clean slate:
oc project daniel-g-fisher
oc delete all --all
oc delete pvc --all
oc delete configmap --all
oc delete secret --all
