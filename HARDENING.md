<!-- markdownlint-disable -->

# Hardening Report: reviewdog--action-cpplint/v1.14.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **reviewdog--action-cpplint/v1.14.0** was hardened automatically. 0 finding(s) were identified and resolved across 1 iteration(s).

## Iteration Notes

### Iteration 1

**Fixes applied:** publish-gate

**Notes:**

entrypoint.sh lines 10-11: replaced bash [[ ]] with POSIX [ ]. Also restored unquoted ${INPUT_REVIEWDOG_FLAGS}: it is a whitespace-separated list input with an empty default, so quoting it passed reviewdog an empty argument, or one combined argument. reviewdog reads the report on stdin, so leaving the expansion unquoted is the right form, and word-splitting is not injection.

