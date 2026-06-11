<!-- markdownlint-disable -->

# Hardening Report: reviewdog--action-cpplint/v1.11.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **reviewdog--action-cpplint/v1.11.0** was hardened automatically. 0 finding(s) were identified and resolved across 2 iteration(s).

## Iteration Notes

### Iteration 1

**Fixes applied:** unsafe-shell

**Notes:**

Fixed Dockerfile line 10: replaced `wget -O - -q ... | sh -s` (pipe-to-shell) with a two-step approach that downloads the install script to /tmp/reviewdog-install.sh first, then executes it separately with `sh /tmp/reviewdog-install.sh`, and cleans up afterward. The URL remains pinned to commit SHA fd59714416d6d9a1c0692d872e38e7f8448df4fc for source-level content integrity.

### Iteration 2

**Fixes applied:** script-injection

**Notes:**

Fixed two unquoted variable expansions in entrypoint.sh: (1) `${INPUT_FLAGS}` on line 10 is now `"${INPUT_FLAGS}"` in the `set --` command, and (2) `${INPUT_TARGETS}` on line 13 is now `"${INPUT_TARGETS}"` in the `cpplint` command. Both variables are sourced from workflow inputs and were vulnerable to shell word-splitting and glob expansion via attacker-controlled metacharacters.

