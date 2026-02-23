#!/bin/bash

INTERFACE=${1:-eth0}
DURATION=${2:-120}
OUTPUT="../baseline/normal_traffic.pcap"

echo "[+] Capturing BASELINE traffic on $INTERFACE for $DURATION seconds..."

sudo tcpdump -i $INTERFACE -w $OUTPUT -G $DURATION -W 1

echo "[+] Baseline capture completed → $OUTPUT"
