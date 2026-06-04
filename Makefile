$PHONY: install

install: prepare
	stow . -t ~/

prepare:
	for SV in .local/service/* ; do \
		mkdir -p $$HOME/$$SV/supervise ; \
	done
