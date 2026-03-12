{{- define "pgbouncer.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "pgbouncer.labels" -}}
app.kubernetes.io/name: {{ include "pgbouncer.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "pgbouncer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pgbouncer.fullname" . }}
{{- end }}

{{- define "pgbouncer.tlsVolumeName" -}}
{{- if .Values.tls.client.existingSecret }}client-tls{{- else }}config-rendered{{- end }}
{{- end }}
