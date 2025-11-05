.. _committer-drm-rust:

=============================
drm-rust Committer Guidelines
=============================

This document describes the detailed merge criteria and committer guidelines for
drm-rust. The same criteria and guidelines apply equally to both committers and
maintainers.

Where Do I Apply My Patch?
==========================

Consult this handy flowchart to determine the best branch for your patch. If in
doubt, ask a maintainer on IRC or Zulip.

.. graphviz:: drm-rust-commit-flow.dot

Please also see the branch description and timeline in :ref:`drm-rust`.

General
=======

The same guidelines as described in :ref:`committer-drm-misc` do apply.

For non-DRM patches usually going through a different tree, please make sure to
get an `Acked-by:` tag from at least one of the drm-rust maintainers, as well as
from the maintainers of the foreign code.

Submit Checklist
================

For the full submit checklist, please see `Linux Kernel - Submit Checklist`_ and
`Rust for Linux - Submit Checklist Addendum`_.

Without constraining the above, the following list provides the most important
checks to run:

* For every individual patch,

  * compile with `CLIPPY=1` and `CONFIG_RUST_KERNEL_DOCTESTS=y` and ensure there
    are not build failures or warnings,

  * execute the `rustfmt` make target to ensure your patch is properly formatted,

  * execute the `rustdoc` make target and ensure it's free of warnings,

  * execute the `htmldocs` or `pdfdocs` make target and ensure you did not
    introduce errors or warnings,

  * run `./scripts/checkpatch.pl --strict --codespell`,

  * if your patch may affect doc-tests, ensure that all doc-tests do still pass.

* For the whole series,

  * compile with both the minimum supported compiler version and the latest
    supported compiler version; see `Linux Kernel - Minimum Requirements`_.

.. _Linux Kernel - Submit Checklist: https://docs.kernel.org/process/submit-checklist.html
.. _Linux Kernel - Minimum Requirements: https://docs.kernel.org/process/changes.html#current-minimal-requirements
.. _Rust for Linux - Submit Checklist Addendum: https://rust-for-linux.com/contributing#submit-checklist-addendum

Tooling
=======

drm-rust git repositories are managed with :ref:`dim`.
