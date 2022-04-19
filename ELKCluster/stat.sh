#!/bin/bash
set -x
ALPHA=$(curl -sS -k -H 'Content-Type: application/json' -X GET 'https://elk.site:9200/filebeat-*/_stats/docs,store' -u elastic:XXXXXXXXX | jq ._all.total.store.size_in_bytes)
BETA=$(cat /root/filebeat_size)

TELEGRAM_BOT_TOKEN="XXXXXXXXX"

A=$(curl -sS -k -H 'Content-Type: application/json' -X GET 'https://elk.gtadev.site:9200/filebeat-*/_stats/docs,store' -u elastic:XXXXXXXXX | jq ._all.total.docs.count)
B=$(cat /root/filebeat_count)

STAT=$(echo `expr $A - $B`)
SIZE_COUNT=$(echo `expr $ALPHA - $BETA`)
SIZE=$(numfmt --to iec --format "%8.4f" $(echo $SIZE_COUNT))

curl -X POST -H 'Content-Type: application/json' -d '{"chat_id": "-1", "text": "В Dev/Test среде за сутки '"$STAT"' логов размером '"$SIZE"'", "disable_notification": true}' \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage

echo $A > /root/filebeat_count
echo $ALPHA > /root/filebeat_size
