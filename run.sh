#! /bin/bash

envsubst < /template/karotaler.rb | tee /app/karotaler.rb
chmod +x /app/karotaler.rb

cron -f && tail -f /var/log/cron.log