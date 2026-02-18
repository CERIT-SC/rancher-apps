
{{- define "name.short" -}}
logging-subscriber
{{- end -}}

{{- define "name.full" -}}
{{- $short := include "name.short" . -}}
{{- printf "%s-%s" .Release.Name $short -}}
{{- end -}}
