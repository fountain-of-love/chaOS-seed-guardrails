# chaOS-seed guardrails

chaOS-seed calls this rib's `make test` target. The `lint` target passes
the guardrails manifest and `make -f Makefile test` to the shared rib
launcher. After linting passes, `run-tests.sh` calls `make test` in the
project snapshot. A failed target blocks the calling commit.

## Child dependencies

Guardrails owns the linting pin in `ribs.conf`. Its Makefile supplies
this manifest to the launcher, which resolves the pinned commit from
a matching sibling checkout or from its HTTPS URL.

The launcher is available as `CHAOS_RIB_LAUNCHER`. It passes the project
snapshot and test scope through to linting. chaOS-seed pins guardrails
as its direct dependency.
