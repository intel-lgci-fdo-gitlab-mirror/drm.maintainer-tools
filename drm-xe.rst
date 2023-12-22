.. _drm-xe:

======
drm-xe
======

-----------------------------------------------------------
drm-xe patch and upstream merge flow and timeline explained
-----------------------------------------------------------

:Copyright: 2015-2023 Intel Corporation
:Author: Jani Nikula <jani.nikula@intel.com>
:Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Introduction
============

This document describes the flow and timeline of drm/xe patches to various
upstream trees.

Rule No. 1
----------

This document is an eternal draft and simply tries to explain the reality of how
drm-xe is maintained. If you observe a difference between these rules and
reality, it is your assumed responsibility to update the rules.

The Relevant Repositories and Branches
======================================

See :ref:`repositories`.

Patch and Merge Flow
====================

Features
--------

Features are picked up and pushed to drm-xe-next by committers and
maintainers. See :ref:`committer-drm-intel` for details. (The
drm-intel guidelines apply also for drm-xe).

Fixes
-----

Fixes are picked up and pushed to drm-xe-next by committers and maintainers,
just like any other patches. This is to ensure fixes are pushed in a timely
manner. Fixes that are relevant for stable, current development kernels, or
drm-xe-next, will be cherry-picked by maintainers to drm-xe-fixes or
drm-xe-next-fixes.

To make this work, patches should be labeled as fixes using the tags printed by
"dim fixes <SHA1 of fixed commit>", and extra care should be put into making fixes
the first patches in series, not depending on preparatory work or cleanup.

Merge Timeline
==============

For predictions on the future merge windows and releases, see
https://jnikula.github.io/linux-kernel-tea-leaves/
