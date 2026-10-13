<!-- markdownlint-disable -->

# Hardening Report: reviewdog--action-cpplint/v1.13.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **reviewdog--action-cpplint/v1.13.0** was hardened automatically. 0 finding(s) were identified and resolved across 1 iteration(s).

## Iteration Notes

### Iteration 1

**Fixes applied:** publish-gate

**Notes:**

Fixed entrypoint.sh lines 10 and 11: replaced bash-specific [[ ]] conditionals with POSIX sh [ ] conditionals to match the #!/bin/sh shebang. The logic is identical — only the bracket syntax changed.

