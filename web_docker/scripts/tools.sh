#!/usr/bin/env bash
if [[ -z $PROD_DEPLOY ]]; then
  apt-get install -y lsof postgresql-client wget netcat git curl wget tree rsync
  gem install dpl
  #wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi
