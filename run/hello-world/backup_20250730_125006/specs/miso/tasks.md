# task
*runnable code*

A `task` is a piece of runnable code that we can call from the command line, or invoke from an agent using natural language.

Tasks are specified using feature-modular snippets in the `specs/miso/tasks/` folder; and runnable code is placed in the `run/` folder.

Tasks can be actual executables eg. shell scripts, python files, client/server apps, and so on; or they can be "agent-runnable scripts" which are natural-language instructions to be followed precisely by agents.