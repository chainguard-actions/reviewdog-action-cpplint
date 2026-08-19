<!-- markdownlint-disable -->

# Hardening Report: reviewdog--action-cpplint/v1.11.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **reviewdog--action-cpplint/v1.11.0** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The workflow uses `reviewdog/action-cpplint@master`, which is pinned to a mutable branch ref rather than an immutable 40-character commit SHA. This means the action code can change at any time without notice, enabling supply-chain attacks. All other `uses:` references in the repository are correctly pinned to full SHA digests.

Locations:

- `.github/workflows/reviewdog.yml:9`

### missing-permissions (severity: medium)

None of the workflow files define a top-level `permissions:` block, and no individual job defines its own `permissions:` block. Without explicit permissions, workflows run with the repository's default token permissions (which may be `write-all` on older repositories), granting broader access than necessary. Each workflow should declare the minimal permissions required.

Locations:

- `.github/workflows/depup.yml:1`
- `.github/workflows/docker-build.yml:1`
- `.github/workflows/pr-test.yml:1`
- `.github/workflows/release.yml:1`
- `.github/workflows/reviewdog.yml:1`
- `.github/workflows/self-test.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

Fixed 2 findings across 6 workflow files:
1. unpinned-uses: Pinned `reviewdog/action-cpplint@master` to full SHA `e6b7ff83701666725925695a056a88f7f86f83e4` (with `# master` comment) in .github/workflows/reviewdog.yml.
2. missing-permissions: Added minimal top-level `permissions:` blocks to all 6 workflow files: depup.yml (contents:write, pull-requests:write), docker-build.yml (contents:read), pr-test.yml (contents:read, checks:write), release.yml (contents:write, pull-requests:write), reviewdog.yml (contents:read, pull-requests:write), self-test.yml (contents:read).

