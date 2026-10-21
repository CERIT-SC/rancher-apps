# Overleaf Community Edition Plus

Overleaf CEP is a self-hosted collaborative LaTeX editor. This chart deploys
the full stack — sharelatex web app, MongoDB, and Redis — as a single pod
with sidecar containers, using a custom CEP build that includes references,
linked-url-proxy, and Zotero integration.

## Features

- **All-in-one pod**: sharelatex + MongoDB (replica set) + Redis as sidecars
- **Persistent storage**: PVC for project files, compile output, and history
- **Private access**: site requires login; self-registration is blocked (403)
- **SMTP support**: configurable relay for activation emails
- **Initial admin user**: automatically created on first start with activation email

## Configuration

Key settings are configurable via the Rancher UI form:

- **Hostname**: the external URL (short name expands to `<host>-<ns>.dyn.cloud.e-infra.cz`)
- **Initial user email**: an admin user is created and an activation email is sent

## Post-install

After the chart installs, the pod takes 1-2 minutes to start (MongoDB replset
init + migrations + all node microservices).
