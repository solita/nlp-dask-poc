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


