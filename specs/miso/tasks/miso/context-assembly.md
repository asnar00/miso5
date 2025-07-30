# context-assembly
*making sure the agent has the right information*

When generating code for a feature `A/B/C.md`, it's important to assemble the correct context for the agent. We do this by reading the following files:

1. Parent context:

`A.md`
`A/B.md`

2. The feature snippet itself:

`A/B/C.md`

3. All child snippets, eg:

`A/B/C/D.md`
`A/B/C/E.md`
`A/B/C/E/F.md`

