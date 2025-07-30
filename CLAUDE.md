# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**miso** is an experimental natural language programming system that allows laypeople to write software using markdown specifications. The system converts hierarchical specification files into runnable code through AI agents.

## Architecture

### Core Concepts
- **Snippets**: Short markdown files (under 250 words) that describe program functions
- **Tasks**: Runnable code pieces that can be called from command line or invoked by agents
- **Hierarchical Organization**: Specifications are organized in a tree structure where details are added through child snippets rather than modifying parent files

### Directory Structure
```
specs/           # All specification files
├── miso.md      # Root specification
└── miso/        # Detailed specifications
    ├── files.md
    ├── tasks.md
    └── tasks/
        ├── hello-world.md
        ├── miso.md
        └── miso/    # miso task implementation details
            ├── backup.md
            ├── change-detection.md
            ├── code-organisation.md
            ├── context-assembly.md
            └── querying.md

run/            # All runnable code implementations
└── [task-name]/ # Each task gets its own folder
    └── pseudocode.md # Agent-readable instructions for the task
```

## Key Implementation Rules

### File Organization (specs/miso/files.md)
- Base spec `A.md` lives in `specs/A.md`
- Details `B.md` for spec `A.md` go in `specs/A/B.md`
- Further details `C.md` for `A/B.md` go in `specs/A/B/C.md`

### Code Organization (specs/miso/tasks/miso/code-organisation.md)
- All files implementing task `A` go in `run/A/`
- Every task folder must contain `pseudocode.md` with agent-readable instructions
- Prefer executable code (Python, shell scripts) over pure natural language instructions

### Context Assembly (specs/miso/tasks/miso/context-assembly.md)
When implementing feature `A/B/C.md`, read in order:
1. Parent context: `A.md`, `A/B.md`
2. The feature snippet: `A/B/C.md`
3. All child snippets: `A/B/C/D.md`, `A/B/C/E.md`, etc.

### Change Detection and Implementation (specs/miso/tasks/miso/change-detection.md)
- Track which spec snippets changed since last run
- Group changes by task and implement one at a time
- Store implemented specs in subfolder inside `run/[task]/` for comparison

### Backup Strategy (specs/miso/tasks/miso/backup.md)
- Always backup `run/` folder before modifications
- Ensure easy rollback capability

### Querying Protocol (specs/miso/tasks/miso/querying.md)
- For simple tasks: implement directly
- For complex/uncertain tasks: ask user for clarification first
- Document reasonable default answers in sub-snippets before continuing

## Main Tasks

### hello-world
Simple greeting task that outputs "hello world!"

### miso
The core system task that:
1. Detects changes in specification snippets
2. Ensures runnable code in `run/` folder correctly implements changes
3. Manages the entire spec-to-code conversion process