#!/bin/bash
echo "Starting cron..."
service cron start
nginx -g 'daemon off;'
