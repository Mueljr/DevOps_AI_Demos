#!/bin/sh

# Set the speed threshold in KB/s
THRESHOLD=500

# Variable to track consecutive slow speed occurrences
slow_count=0

while true; do
  # Measure connection speed (downloading a small file)
  speed=$(curl -s -w '%{speed_download}' -o /dev/null https://speed.hetzner.de/100MB.bin)
  
  # Check if speed is empty or invalid
  if [ -z "$speed" ] || ! echo "$speed" | grep -Eq '^[0-9]+(\.[0-9]+)?$'; then
    echo "Failed to measure speed. Retrying..."
    sleep 10
    continue
  fi

  # Convert speed from bytes/s to KB/s
  speed_kbps=$(echo "$speed / 1024" | awk '{printf "%.0f", $1}')  # Using `awk` for precision

  echo "Current speed: ${speed_kbps} KB/s"

  if [ "$speed_kbps" -lt "$THRESHOLD" ]; then
    slow_count=$((slow_count + 1))
    echo "Speed below threshold ($THRESHOLD KB/s). Slow count: $slow_count"
  else
    slow_count=0  # Reset the counter if speed is above threshold
  fi

  # Retry the pull if slow speed is detected twice in a row
  if [ "$slow_count" -ge 2 ]; then
    echo "Connection speed is slow twice in a row. Retrying pull..."
    timeout 10s ollama pull llama3.2:3b  # specify your model here
    slow_count=0  # Reset the counter after a pull attempt
  fi

  # Wait for a few seconds before checking again
  sleep 7
done
