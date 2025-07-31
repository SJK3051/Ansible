#!/bin/bash

usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$usage" -gt 90 ]; then
  echo "DISK USAGE CRITICAL: ${usage}%"
  exit 1
else
  echo "DISK OK: ${usage}%"
  exit 0
fi
