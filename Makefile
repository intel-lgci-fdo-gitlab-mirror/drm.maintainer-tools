# The documentation build depends on Sphinx and graphviz, and the resulting html
# uses http://wavedrom.com/ online for rendering the timeline. The offline
# wavedrom conversion seems a bit tricky to install, but is possible if
# needed. To edit the wavedrom json, copy-pasting to and from
# http://wavedrom.com/editor.html is handy as it shows the result live.
#
# The man pages and mancheck depend on rst2html, but the rest of the pages don't
# need to be limited to rst2html.

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS   ?=
SPHINXBUILD  ?= $(shell command -v sphinx-build-3 || command -v sphinx-build)
RST2MAN      ?= $(shell command -v rst2man-3 || command -v rst2man)
SOURCEDIR     = .
BUILDDIR      = _build

CFLAGS = -O2 -g -Wextra

.PHONY: all
all: remap-log

remap-log: remap-log.c
	$(CC) $(CFLAGS) -o $@ $<

SC_EXCLUDE := \
	-e SC2001 \
	-e SC2034 \
	-e SC2046 \
	-e SC2086 \
	-e SC2115 \
	-e SC1117 \
	-e SC2119 \
	-e SC2120 \
	-e SC2207

shellcheck:
	shellcheck $(SC_EXCLUDE) dim bash_completion

mancheck:
	@for cmd in $$(./dim list-commands); do \
		if ! grep -q "^$$cmd" dim.rst; then \
			echo "$@: $$cmd not documented"; \
		fi \
	done
	$(RST2MAN) --strict --no-raw dim.rst >/dev/null

check: shellcheck mancheck doccheck

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

.PHONY: doccheck
doccheck:
	$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) -EWnq $(O)

livehtml:
	sphinx-autobuild -b html "$(SOURCEDIR)" "$(BUILDDIR)/html"

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# Also spell out some targets explicitly to get tab completion.
.PHONY: html linkcheck
.DEFAULT html linkcheck: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
