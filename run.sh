#! /bin/bash

envsubst < /template/karotaler.rb | tee /app/karotaler.rb
chmod +x /app/karotaler.rb

/usr/sbin/crond -f -l 8
