#!/bin/bash

# Get the next available chat number
CHAT_DIR="/Users/asnaroo/Desktop/experiments/miso/chats"
CHAT_NUM=1

while [[ -f "$CHAT_DIR/chat-$(printf "%03d" $CHAT_NUM).md" ]]; do
    ((CHAT_NUM++))
done

CHAT_FILE="$CHAT_DIR/chat-$(printf "%03d" $CHAT_NUM).md"

# Use AppleScript to select all, copy, then deselect
osascript << EOF
tell application "System Events"
    -- Select all content
    keystroke "a" using command down
    delay 0.5
    -- Copy to clipboard
    keystroke "c" using command down
    delay 0.5
    -- Deselect by pressing down arrow
    key code 125
end tell
EOF

# Get clipboard content and save to file
pbpaste > "$CHAT_FILE"

echo "Chat saved to: $CHAT_FILE"