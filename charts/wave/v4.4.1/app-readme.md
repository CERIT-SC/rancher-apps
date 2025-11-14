# Wave

Wave watches Deployments, StatefulSets and DaemonSets within a Kubernetes cluster and ensures that their Pods always have up to date configuration.

By monitoring mounted ConfigMaps and Secrets, Wave can trigger a Rolling Update of the Deployment when the mounted configuration is changed.

## Usage

Wave watches all Deployments within a namespace but only processes those that have the annotation `wave.pusher.com/update-on-config-change: "true"` which allows individual service owners to opt-in to the Wave controller.

Therefore, to enable Wave for your Deployment, add the `wave.pusher.com/update-on-config-change` annotation to your Deployment as shown below:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    wave.pusher.com/update-on-config-change: "true"
#...
```
