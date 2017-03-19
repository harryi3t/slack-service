#!/bin/bash -e
source color.sh

format() {
  echo "|-$BOLD$1 $2 $NORMAL"
}

error() {
  format "$RED" "Failed with error. $1"
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
}

main
