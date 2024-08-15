#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/android-remote-camera
DATA_DIR=$(DESTDIR)$(PREFIX)/share/android-remote-camera
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard android-remote-camera/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-android-remote-camera install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-android-remote-camera:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 android-remote-camera/android-remote-camera "$(BIN_DIR)"

.PHONY: check install install-doc install-android-remote-camera shellcheck
