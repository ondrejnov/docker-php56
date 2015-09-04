#!/bin/bash
set -e

service exim4 restart
service memcached start
apache2-foreground

exec "$@"
