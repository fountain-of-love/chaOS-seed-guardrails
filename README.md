# chaOS-seed guardrails

chaOS-seed fetches a pinned archive of this rib and calls `make test`.
The `lint` target passes `make -f Makefile test` as the command to run
inside the fetched linting archive.
After linting passes, `run-tests.sh` delegates to `make test` in the
project snapshot. The two implementations own their rules and
dependencies. A failed target blocks the calling commit.

## Publishing and delegation

Publish each rib as a commit-pinned gzip tar archive with one top-level
directory and a root `Makefile` that provides a phony `test` target.
Pin the linting archive in `ribs.conf` using the `linting` name and `shared`
scope. Pin the parent archive in chaOS-seed's manifest as `guardrails`.
A development archive can supply a local `file:///` pin in its manifest.

The launcher provides the project snapshot and scope to both ribs.
When testing moves into a sibling rib, the same `make test` contract
can be used to call that rib and its language-specific implementations.
