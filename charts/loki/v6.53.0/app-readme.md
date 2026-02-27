# Loki

Loki is a log aggregation system inspired by Prometheus. It is designed to store and query logs from cloud-native environments.

Loki is pre-configured for CERIT-SC environment with simple setup which includes:
- monolithic SingleBinary mode
- doesn't support HA
- only the Loki and the Gateway components
- supports only the local PVC (nfs-csi) storage