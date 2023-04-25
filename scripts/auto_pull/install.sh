#!/bin/bash

cat crontab.entry >> /var/spool/cron/crontabs/$USER
cat .env | grep ORC >> /etc/environment
