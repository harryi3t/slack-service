#!/bin/bash
# Usage: ./post.sh <webhook> <channel> <message>

# Enter the name of your slack webhook here
# To create one visit https://my.slack.com/services/new/incoming-webhook/
# https://hooks.slack.com/services/foo/bar
webhook=$1

if [[ $webhook == "" ]]
then
  echo "No host specified"
  exit 1
fi

shift
channel=$1
if [[ $channel == "" ]]
then
  echo "No channel specified"
  exit 1
fi

shift
text=$*

if [[ $text == "" ]]
then
  echo "No text specified"
  exit 1
fi

escapedText=$(echo $text | sed 's/"/\"/g' | sed "s/'/\'/g" )
json="{\"channel\": \"#$channel\", \"text\": \"$escapedText\"}"

echo "Sending message ..."

response=$(curl -X POST -s -d "payload=$json" "$webhook")

echo $response | grep -q 'ok'

if [[ $? != 0 ]]
then
  printf "\nError with response:\n"
  echo "$response"
  echo "json sent was:"
  echo "$json"
  echo ""
  exit 1
fi

echo "Message was sent successfully"
