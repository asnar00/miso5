# code-organisation
*where runnable code is stored*

All files that implement task `A` should be stored in the folder `run/A/`.

Every task folder should contain a description of the code in the file `pseudocode.md`. The goal is that an agent can perform the task simply by reading the pseudocode and following its instructions.

Wherever possible, the task should be implemented as normal executable code eg. python, shell scripts, and so on.

## Important: Task Organization Rules

When implementing tasks specified in `specs/miso/tasks/X/Y.md`, create a separate task folder `run/Y/` for each individual task. Do NOT nest task implementations under `run/miso/` - each task gets its own top-level folder in `run/`.

For example:
- `specs/miso/tasks/hello-world.md` → `run/hello-world/`
- `specs/miso/tasks/miso/save-chat.md` → `run/save-chat/`
- `specs/miso/tasks/miso/backup.md` → would be `run/backup/` (if it were a standalone task)