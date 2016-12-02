#!/usr/bin/env bash
RAILS_ENV="${RAILS_ENV:-development}"
echo "Using RAILS ENV: ${RAILS_ENV}"
# just in case the pid did not get removed
rm -f /home/www/app/tmp/pids/server.pid
bundle install
# return 0 if db exists
function db_exists() {
  echo $PGPASSWORD | psql -w -h "${POSTGRES_HOST}" -c '\l' |grep ${1} > /dev/null
  echo $?
}

function rails_running() {
  lsof -i :${PORT} > /dev/null
  echo $?
}

db_name="above_${RAILS_ENV}"
db_exists_value=$(db_exists $db_name)
# only needed when the gems change
#bundle install
if [[ $db_exists_value -eq 1 ]]; then
  bundle exec rake db:setup
else
  echo "The database: ${db_name} already exists, skipping rake db:setup"
  bundle exec rake db:migrate
fi
# run the server
is_running=$(rails_running)
if [[ $is_running -eq 1 ]]; then
  foreman start
else
  echo "Rails is already running, skipping rails server -b 0.0.0.0"
fi
