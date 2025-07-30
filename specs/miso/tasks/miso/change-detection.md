# change-detection
*ensuring we minimise the work miso does*

When `miso` is run, make a list of the spec snippets that have changed since the last time we ran; list these files for the user, and then go ahead and implement.

If more than one task has changed, group the changes by task and implement them one at a time.

Store the implemented `spec/` snippets in a subfolder inside the `run/` task folder, so it's always clear what spec has actually been implemented, compared to what's changed.