
{{ range $domain :=  split .Env.DOMAINS "," }} 
{{ printf "%s" $domain }}
{{end}}