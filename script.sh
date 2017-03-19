#!/bin/bash -e
source color.sh

format() {
  echo "|-$BOLD$1 $2 $NORMAL"
}

check_env() {
  format "$BLUE" "Checking for envs"
}

send_message() {
  format "$BLUE" "Sending message"
}

main() {
  format "$YELLOW" "Starting slack-service script"
  check_env
  send_message
  cat /build/IN/slack-tester/runSh/slack-tester.env
  sleep 600
}

main
