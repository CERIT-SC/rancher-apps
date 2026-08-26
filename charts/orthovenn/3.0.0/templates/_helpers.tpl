{{/*
Expand the name of the chart.
*/}}
{{- define "orthovenn.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Fully qualified app name. Truncated at 63 chars because some Kubernetes name
fields are limited to this (by the DNS naming spec).
*/}}
{{- define "orthovenn.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Chart name and version as used by the chart label.
*/}}
{{- define "orthovenn.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "orthovenn.labels" -}}
helm.sh/chart: {{ include "orthovenn.chart" . }}
app.kubernetes.io/name: {{ include "orthovenn.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels. Limited to the single "app" label: Deployment and Service
selectors are immutable and must stay stable across upgrades of installed
releases.
*/}}
{{- define "orthovenn.selectorLabels" -}}
app: {{ include "orthovenn.fullname" . }}
{{- end }}

{{/*
Name of the service account to use.
*/}}
{{- define "orthovenn.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "orthovenn.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Name of the MySQL Service. Overridable because the API image references the
database by a fixed hostname.
*/}}
{{- define "orthovenn.db.serviceName" -}}
{{- default (printf "%s-mysql" (include "orthovenn.fullname" .)) .Values.service.db.nameOverride }}
{{- end }}

{{/*
Name of the Secret holding the database password.
*/}}
{{- define "orthovenn.db.secretName" -}}
{{- if .Values.db.auth.existingSecret }}
{{- .Values.db.auth.existingSecret }}
{{- else }}
{{- printf "%s-mysql" (include "orthovenn.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Database password. Resolution order:
  1. .Values.db.auth.password, when set;
  2. the password already stored in the Secret, so upgrades keep it;
  3. a freshly generated random password.
*/}}
{{- define "orthovenn.db.password" -}}
{{- if .Values.db.auth.password }}
{{- .Values.db.auth.password }}
{{- else }}
{{- $name := printf "%s-mysql" (include "orthovenn.fullname" .) }}
{{- $existing := (lookup "v1" "Secret" .Release.Namespace $name) }}
{{- $key := .Values.db.auth.secretKey }}
{{- if and $existing (index $existing.data $key) }}
{{- index $existing.data $key | b64dec }}
{{- else }}
{{- randAlphaNum 24 }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Render an image reference from a map with repository/tag/digest keys.
Usage: {{ include "orthovenn.image" .Values.api.image }}
*/}}
{{- define "orthovenn.image" -}}
{{- if .digest }}
{{- printf "%s@%s" .repository .digest }}
{{- else if .tag }}
{{- printf "%s:%s" .repository (.tag | toString) }}
{{- end }}
{{- if and (not .digest) (not .tag) }}
{{- .repository }}
{{- end }}
{{- end }}

{{/*
Public DNS name of the release, `<release>-<namespace>` under the cluster's
wildcard domain. Both domains are cluster-wide wildcard records pointing at
their cluster's load balancer, so the name resolves without a record being
registered for it.

The pair is used whole so that the name is unique per release: truncating either
half lets two releases in different namespaces claim the same hostname, and
Traefik has no way to arbitrate between the resulting routes. Only when the pair
exceeds the 63-character DNS label limit is it shortened, and a digest of the
full namespace and release name is appended to keep it unique.
*/}}
{{- define "dns.name" -}}
{{- $domain := "dyn.cloud.e-infra.cz" -}}
{{- if eq .Values.global.cattle.clusterName "kubas-cluster" -}}
{{- $domain = "dyn.cloud.trusted.e-infra.cz" -}}
{{- end -}}
{{- $label := printf "%s-%s" .Release.Name .Release.Namespace -}}
{{- if gt (len $label) 63 -}}
{{- $digest := printf "%s/%s" .Release.Namespace .Release.Name | sha256sum | trunc 8 -}}
{{- $label = printf "%s-%s-%s" (trunc 22 .Release.Name) (trunc -22 .Release.Namespace) $digest -}}
{{- end -}}
{{ printf "%s.%s" $label $domain }}
{{- end -}}

{{/*
Externally visible hostname: .Values.host when set, otherwise the generated
name above.
*/}}
{{- define "orthovenn.host" -}}
{{- .Values.host | default (include "dns.name" .) }}
{{- end }}

{{/*
TLS Secret name for the route.
*/}}
{{- define "orthovenn.tlsSecretName" -}}
{{- default (include "orthovenn.host" . | replace "." "-") .Values.ingressRoute.tls.secretName }}
{{- end }}

{{/*
Name of the basic-auth Secret consumed by the Traefik middleware.
*/}}
{{- define "orthovenn.basicAuth.secretName" -}}
{{- if .Values.basicAuth.existingSecret }}
{{- .Values.basicAuth.existingSecret }}
{{- else }}
{{- printf "%s-basic-auth" (include "orthovenn.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Basic-auth credentials. The render fails rather than defaulting blank
credentials.
*/}}
{{- define "orthovenn.basicAuth.username" -}}
{{- required "basicAuth.username must be set when basicAuth.enabled is true" .Values.basicAuth.username }}
{{- end }}

{{- define "orthovenn.basicAuth.password" -}}
{{- required "basicAuth.password must be set when basicAuth.enabled is true" .Values.basicAuth.password }}
{{- end }}

{{/*
htpasswd line for the Traefik basicAuth middleware Secret.
*/}}
{{- define "orthovenn.basicAuth.users" -}}
{{- htpasswd (include "orthovenn.basicAuth.username" .) (include "orthovenn.basicAuth.password" .) }}
{{- end }}

{{/*
Middleware references attached to the IngressRoute.
*/}}
{{- define "orthovenn.ingressRoute.middlewares" -}}
{{- if .Values.basicAuth.enabled }}
- name: {{ printf "%s-basic-auth" (include "orthovenn.fullname" .) }}
{{- end }}
{{- range .Values.ingressRoute.middlewares }}
- name: {{ .name }}
  {{- with .namespace }}
  namespace: {{ . }}
  {{- end }}
{{- end }}
{{- end }}
