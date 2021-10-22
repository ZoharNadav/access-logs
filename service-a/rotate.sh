#!/bin/bash
DATE=$(date +%Y-%m-%d-%H-%M)
# Here should be code that moves logs aside and uploads to Blob (Good luck)

awk -v d1="$(date --date '-1 min' '+%d/%b/%Y:%T')" '{gsub(/^[\[\t]+/, "", $4);}; $4 > d1' /var/log/nginx/access.log > /var/log/nginx/logs-per-minute/access.log-$DATE

azcopy copy "/var/log/nginx/logs-per-minute/access.log-$DATE" "https://k8sinterview.blob.core.windows.net/zohar/YOUR_SAS_TOKEN"
