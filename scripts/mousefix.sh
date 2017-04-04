#!/bin/bash
while read -r devID; do
  xinput set-prop ${devID} "Device Accel Constant Deceleration" 8.500000
  xinput set-prop ${devID} "Device Accel Adaptive Deceleration" 8.500000
done < <(xinput | grep "E-Signal USB Gaming Mouse" | grep -o "id=.*" | awk '{print $1}' | cut -d'=' -f2)
