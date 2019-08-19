# minikube-helm-jenkins

Verify minikube is running:
```
$ minikube status
minikube: Running
cluster: Running
kubectl: Correctly Configured: pointing to minikube-vm at 192.168.99.100
```


Jenkins URL : `jenkins.etc.com`

Get the minikibe VM ip from below command and add it to `/etc/hosts` file against the above URL
```
$ minikube ip
```


Install tiller:
```
$ helm init
```


Deploy Jenkins. The deployment starts with 2 master nodes. Slaves are dynamically created as required:
```
$ ./start.sh
```


Remove all the above deployments:
```
$ ./stop.sh
```
