# miso
*a system for writing software using natural language*

`miso` is an experimental approach to letting laypeople write their own software, without sacrificing readability, maintainability and robustness.

In `miso`, we specify programs using a tree of *snippets* - short markdown files that describe the function we want. Snippets should remain short (under 250 words or so); to add detail, we create child snippets, rather than modify the original.

Under the hood, an agent (in this case Claude Code) work to convert the specifications into runnable code.