#!/bin/sh

# Ensure permissions are set correctly on the Squid cache + log dir.

dockerize -template /etc/squid/allowedurls.tpl:/etc/squid/allowedurls
$@
