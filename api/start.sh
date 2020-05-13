#!/bin/bash

rm -f tmp/pids/server.pid
rake db:migrate db:seed
bundle exec rails s -b '0.0.0.0'
