# save-chat Task Implementation

This task saves the entire Claude Code terminal conversation to a markdown file in the `chats/` folder.

## Task Description
The save-chat task captures the complete terminal session and stores it as a markdown file with auto-incrementing filename.

## Implementation
When the save-chat task is executed:
1. Determine next available filename (`chat-001.md`, `chat-002.md`, etc.) in `chats/` folder
2. Use AppleScript to select all terminal content (Cmd-A)
3. Copy content to clipboard (Cmd-C)  
4. Deselect content (down arrow key)
5. Save clipboard content to the numbered markdown file
6. Report the saved filename to user

## Usage
- Command: `save-chat`
- Output files: `chats/chat-XXX.md` where XXX is auto-incremented

## Agent Instructions
To execute this task:
1. Run the save-chat.sh script
2. The script handles all AppleScript automation and file management
3. Ensure the chats/ directory exists before saving