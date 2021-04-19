# Set up redis cluster

```
cd k8s
kubectl apply -f redis-cluster.config.yml
kubectl apply -f redis-cluster.statefulset.yml
POD_IPS=$(kubectl get pods -l app=redis-cluster -o jsonpath={range.items[*]}{.status.podIP}:6379 ")
kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $POD_IPS
#Verify cluster state
kubectl exec -it redis-cluster-0 -- redis-cli cluster info
```
