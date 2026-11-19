#!/bin/sh
exec make -C "${CHAOS_CHECKOUT:?Set CHAOS_CHECKOUT to the project under test.}" -f Makefile test
