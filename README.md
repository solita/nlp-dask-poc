# nlp-dask-poc
Tiny repository to support POC of building a Dask distributed computing environment over Kubernetes

The example is derived from
https://docs.dask.org/en/latest/setup/kubernetes.html

## Files

`config.yaml` 

A configuration for Helm to set limits and extra pip / conda
packages to use in Dask cluster. Taken from
https://docs.dask.org/en/latest/setup/kubernetes-helm.html#configure-environment.
- Lowered the CPU requirement to run on Docker with only 8 cores allocated.

## Requirements

Docker with at least 9 CPU cores, 20 GB ram. I had 100 GB disk allocated, I do not know a minimum.

## Procedures

### Installing Dask with Helm

[Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) (OSX)
```
brew install minikube
minikube start
minikube dashboard
```

[Helm](https://helm.sh/docs/intro/install/), the "package manager" for Kubernetes (OSX)
```
brew install helm
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add dask https://helm.dask.org/
helm repo update
```

[Dask](https://helm.dask.org)
```
helm install dask dask/dask
kubectl get services
NAME             TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)           AGE
dask-jupyter     ClusterIP   10.109.68.3    <none>        80/TCP            52s
dask-scheduler   ClusterIP   10.103.58.80   <none>        8786/TCP,80/TCP   52s
kubernetes       ClusterIP   10.96.0.1      <none>        443/TCP           3d23h
```

### Opening views to services

Note1: Minicube running on Docker will need the terminal to keep service visible on localhost. So these commands block. Quit them with CTRL+C when done with them.

Note2: The dask-scheduler offers two urls. For me the latter worked in browser.

Note3: Any work done with the Jupyter will be lost if the cluster shuts down. The persistence needs further work yet.

```
minikube service --url dask-jupyter
minikube service --url dask-scheduler
minikube dashboard
```
