#!/bin/sh

dockerize -template /etc/squid/allowedurls.tpl:/etc/squid/allowedurls
$@
