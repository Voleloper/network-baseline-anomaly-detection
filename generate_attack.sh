#!/bin/bash

TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Usage: ./generate_attack.sh <TARGET_IP>"
  exit 1
fi

echo "[+] Starting reconnaissance attack..."

# Fast scan
nmap -T4 -p- $TARGET

# Service scan
nmap -sV $TARGET

# Aggressive scan
nmap -A $TARGET

echo "[+] Attack simulation completed"
