#!/bin/bash

TEMP_FILE=$(mktemp)

eb ssh $@ 2>"$TEMP_FILE" && exit 0
exit_code=$?

error_message=$(<"$TEMP_FILE")
rm -f "$TEMP_FILE"

if [[ $exit_code -ne 0 ]]; then
  if echo "$error_message" | grep -q "REMOTE HOST IDENTIFICATION HAS CHANGED"; then
    echo "REMOTE HOST IDENTIFICATION HAS CHANGED!"
    echo "Try to remove host key in ~/.ssh/known_hosts"
    instance_ip=$(echo "$error_message" | grep -oE "ECDSA host key for [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | sed 's/ECDSA host key for //')
    ssh-keygen -R "$instance_ip"
    eb ssh $@
  else
    echo "$error_message"
  fi
fi
