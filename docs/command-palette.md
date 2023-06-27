####  Viewing cluster information on Civo CLI 

```civo kubernetes show [cluster_name]```

#### Downloading the cluster's kubeconfig from the command line

```civo kubernetes config civo-cluster --save ```

#### Access the cluster

``` kubectx ```

#### Test access

``` kubectl get ns ```

#### Flux Dashboard ####

``` kubectl -n flux-system port-forward service/ww-gitops-weave-gitops 9001:9001```