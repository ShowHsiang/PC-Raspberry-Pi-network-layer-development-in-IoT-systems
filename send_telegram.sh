#!/bin/bash

TOKEN="<YourBOTToken>"
CHAT_ID="<YourChatID>"
MESSAGE="Work Status: GOOD"

curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"
