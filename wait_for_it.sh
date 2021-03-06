#!/bin/bash
echo "Using RAILS ENV: ${RAILS_ENV}"
set -e
host="$1"
shift
cmd="$@"
until echo $PGPASSWORD | psql -w -h "$host" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 2
done

>&2 echo "Postgres is up - executing command"
exec $cmd
