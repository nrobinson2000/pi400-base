.PHONY=sync

all: sync

# Syncronize files with files on current system
sync:
	scripts/updcfg
	scripts/updpkgs
	scripts/updskel
	scripts/updsrc
