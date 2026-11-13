{{- define "dns.name" -}}
{{- if eq .Values.global.cattle.clusterName "kubas-cluster" -}}
{{ printf "%s-%s.dyn.cloud.trusted.e-infra.cz" (trunc 15 .Release.Name) (trunc -15 .Release.Namespace) }}
{{- else -}}
{{ printf "%s-%s.dyn.cloud.e-infra.cz" (trunc 15 .Release.Name) (trunc -15 .Release.Namespace) }}
{{- end -}}
{{- end -}}

{{- define "secret.name" -}}
{{ (include "dns.name" .) | replace "." "-" }}-tls
{{- end -}}

{{- define "storage.name" -}}
{{ printf "%s-%s-%s" .Release.Name .Release.Namespace .Values.storage.server | regexFind "^[^/]*" | replace "." "-" | trunc 59 }}
{{- end -}}
