# miso Task Implementation

This pseudocode describes how to implement the `miso` task that identifies changes in specification snippets and ensures runnable code correctly implements those changes.

## Main Process

1. **Create Backup**
   - Before making any modifications to the `run/` folder
   - Create a timestamped backup copy of the entire `run/` directory
   - Store backup in a location that allows easy restoration if something goes wrong

2. **Change Detection**
   - Compare current `specs/` directory with previously implemented specs stored in `run/[task]/specs/`
   - Identify all `.md` files that have been added, modified, or deleted since last run
   - Generate a list of changed specification snippets
   - Display the list of changes to the user for review

3. **Group Changes by Task**
   - Parse the changed file paths to identify which tasks are affected
   - Group changes by task name (e.g., all changes under `specs/miso/tasks/hello-world/` belong to the `hello-world` task)
   - If multiple tasks have changes, process them one at a time

4. **For Each Changed Task**
   
   ### Context Assembly
   - For each changed snippet `A/B/C.md`, assemble complete context by reading:
     - Parent context files: `A.md`, `A/B.md`
     - The target snippet: `A/B/C.md`
     - All child snippets recursively: `A/B/C/D.md`, `A/B/C/E.md`, `A/B/C/E/F.md`, etc.
   
   ### Query for Clarification (if needed)
   - If the task being implemented is complex or has significant uncertainty
   - Ask the user for clarification on important questions
   - Based on answers, create sub-snippets in the original specification
   - If query has reasonable default answer, document both query and answer in sub-snippet
   
   ### Code Generation/Update
   - Generate or update runnable code in the appropriate `run/[task]/` folder
   - Ensure code follows the specifications exactly
   - Create or update `pseudocode.md` file that allows agents to perform the task
   - Prefer executable code (Python, shell scripts) over pure natural language instructions where possible
   
   ### Store Implemented Specs
   - Copy the implemented specification snippets to `run/[task]/specs/`
   - This creates a record of what has actually been implemented
   - Allows comparison between current specs and implemented specs in future runs

5. **Completion**
   - Report successful implementation of all changes
   - Provide summary of what was modified or created
   - Ensure all runnable code is properly organized in task-specific folders

## Error Handling
- If backup creation fails, abort the process
- If spec files are malformed or unreadable, report errors and skip
- If code generation fails, restore from backup and report the issue
- Maintain system in consistent state at all times

## File Organization Rules
- All task implementations go in `run/[task-name]/`
- Each task folder must contain `pseudocode.md`
- Implemented specs are stored in `run/[task-name]/specs/` for tracking
- Backup folder should be named with timestamp for easy identification