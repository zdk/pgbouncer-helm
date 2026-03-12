# pgbouncer-helm

[PgBouncer](https://www.pgbouncer.org/) on Kubernetes. Self-signed TLS supported. [Chart Repo](https://zdk.github.io/pgbouncer-helm/).

## Install

```bash
helm repo add pgbouncer https://zdk.github.io/pgbouncer-helm
helm install my-pgbouncer pgbouncer/pgbouncer -f values.yaml
```

## Configure

```yaml
databases:
  mydb:
    host: postgres.default.svc.cluster.local
    port: 5432
    dbname: mydb

envFrom:
  - secretRef:
      name: my-db-credentials  # DB_USER, DB_PASSWORD

pgbouncer:
  poolMode: transaction
  defaultPoolSize: 5
  maxClientConn: 100

tls:
  client:
    enabled: false
    existingSecret: ""  # tls.crt + tls.key
  server:
    sslmode: prefer

service:
  type: ClusterIP
  port: 6432
```

## Requirements

- Kubernetes 1.19+
- Helm 3+
