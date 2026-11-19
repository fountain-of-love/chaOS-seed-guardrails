.PHONY: test lint

test: lint
	@./run-tests.sh

lint:
	@"$${CHAOS_RIB_LAUNCHER:?Use the rib launcher.}" \
	  --repo "$${CHAOS_CHECKOUT:?Set CHAOS_CHECKOUT.}" --ribs "$$PWD/ribs.conf" --rib linting \
	  -- make -f Makefile test
