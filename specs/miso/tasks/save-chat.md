# save-chat
*storing agent conversation for later reference*

The `save-chat` command copies the entire contents of the Claude Pro terminal window and saves it as a markdown file into the `chats/` folder in the project directory.

The filename should be `chats/chat-xxx.md` where `xxx` is incremented each time a new Claude Code session is created.

## implementation

Instead of using python, use AppleScript to implement `cmd-A`, `cmd-C` to capture the terminal contents. When done, virtually press the `down` arrow to deselect.