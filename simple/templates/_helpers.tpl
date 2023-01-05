{{- define "simple.labels" -}}
app: simple-app
env: {{ .Values.app.env }}
{{- end -}}

