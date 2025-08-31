#!/bin/sh
SEP="/"
DATE=$(date +"%H:%M")
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@| awk '{print int($2 * 100)}')
if [ "$VOLUME" -eq 0 ]; then
    VOLUME_ICON=""
else
    VOLUME_ICON=""
fi
WIFI_INTRFC=$(iw dev | awk '$1=="Interface"{print $2}')
WIFI=""
if [ -n "$WIFI_INTRFC" ]; then
    STATUS=$(iw dev "$WIFI_INTRFC" link)
    if echo "$STATUS" | grep -q "Connected to"; then
        WIFI=""
    fi
fi

xsetroot -name " $VOLUME_ICON $VOLUME $SEP $WIFI $SEP  $DATE"
