Simple Docker Container for doing a whitelist http proxy via squid.

To use

Give a comma separated listed of allowed urls for squid.
note that prepending with `.` is for all subdomains

e.g.

`docker run -it -p 8080:8080 -e DOMAINS=.g oogle.com,.amazonaws.com squid`

This runs an http/s proxy that will allow all queries to *.google.com and *.amazonaws.com through and everything else will be rejected with a 503