#! /bin/bash

if [ ! -f /app/config/config.yaml ]; then
  cp /template/config.yaml.example /app/config/config.yaml
fi

cron -f && tail -f /var/log/cron.log