{{- define "langflow.filesByDir" -}}
{{- $filesByDir := dict }}
{{- range $path, $_ := .Files.Glob "files/**" }}
  {{- $trimmed := trimPrefix "files/" $path }}
  {{- $parts := splitList "/" $trimmed }}
  {{- if gt (len $parts) 1 }}
    {{- $dir := index $parts 0 }}
    {{- $group := get $filesByDir $dir | default dict }}
    {{- $group = merge $group (dict $path $path) }}
    {{- $_ := set $filesByDir $dir $group }}
  {{- end }}
{{- end }}
{{- $filesByDir | toYaml }}
{{- end }}

