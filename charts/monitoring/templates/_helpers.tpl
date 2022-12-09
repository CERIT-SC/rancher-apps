{{- define "grafana.fullname" -}}
{{- $name := default .Chart.Name -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "grafana.service" -}}
{{- printf "%s-grafana" .Release.Name -}}
{{- end -}}

{{- define "dns.name" -}}
{{ printf "%s-%s.dyn.cloud.e-infra.cz" (trunc 15 .Release.Name) (trunc -15 .Release.Namespace) }}
{{- end -}}

{{- define "secret.name" -}}
{{ (include "dns.name" .) | replace "." "-" }}-tls
{{- end -}}
