{{/*
Resolve the externally-visible hostname.
- FQDN (contains a dot) -> used as-is.
- Short host -> <host>-<namespace>.dyn.cloud.e-infra.cz (HYPHEN, not dot!)
*/}}
{{- define "overleaf.host" -}}
{{- if contains "." .Values.host -}}
{{- .Values.host -}}
{{- else -}}
{{- printf "%s-%s.dyn.cloud.e-infra.cz" .Values.host .Release.Namespace -}}
{{- end -}}
{{- end -}}

{{/* Full image reference: repository@sha256:digest or repository:tag */}}
{{- define "overleaf.image" -}}
{{- if .digest -}}
{{- printf "%s@%s" .repository .digest -}}
{{- else -}}
{{- printf "%s:%s" .repository .tag -}}
{{- end -}}
{{- end -}}
