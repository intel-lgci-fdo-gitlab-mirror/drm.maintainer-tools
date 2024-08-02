# The documentation build depends on Sphinx and graphviz, and the resulting html
# uses http://wavedrom.com/ online for rendering the timeline. The offline
# wavedrom conversion seems a bit tricky to install, but is possible if
# needed. To edit the wavedrom json, copy-pasting to and from
# http://wavedrom.com/editor.html is handy as it shows the result live.
#
# The man pages and mancheck depend on rst2html, but the rest of the pages don't
# need to be limited to rst2html.

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD  ?= $(shell command -v sphinx-build-3 || command -v sphinx-build)
RST2MAN      ?= $(shell command -v rst2man-3 || command -v rst2man)
PAPER         =
BUILDDIR      = _build

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

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

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  dirhtml    to make HTML files named index.html in directories"
	@echo "  singlehtml to make a single large HTML file"
	@echo "  linkcheck  to check all external links for integrity"
	@echo "  doctest    to run all doctests embedded in the documentation (if enabled)"
	@echo "  doccheck   to check standalone HTML build"
	@echo "  mancheck   to check man pages using rst2html"
	@echo "  shellcheck to check shell scripts using shellcheck"
	@echo "  check      to run all *check targets"

.PHONY: html
html:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

.PHONY: dirhtml
dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

.PHONY: singlehtml
singlehtml:
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

.PHONY: linkcheck
linkcheck:
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/output.txt."

.PHONY: doctest
doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."

.PHONY: doccheck
doccheck:
	$(SPHINXBUILD) -EWnq -b html $(ALLSPHINXOPTS) $(BUILDDIR)/doccheck

livehtml:
	sphinx-autobuild -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
