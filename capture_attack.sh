#!/bin/bash

INTERFACE=${1:-eth0}
DURATION=${2:-120}
OUTPUT="../attack/attack_traffic.pcap"

echo "[+] Capturing ATTACK traffic on $INTERFACE for $DURATION seconds..."

sudo tcpdump -i $INTERFACE -w $OUTPUT -G $DURATION -W 1

echo "[+] Attack capture completed → $OUTPUT"
