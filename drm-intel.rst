.. _drm-intel:

===========
 drm-intel
===========

--------------------------------------------------------------
drm-intel patch and upstream merge flow and timeline explained
--------------------------------------------------------------

:Copyright: 2015 Intel Corporation
:Author: Jani Nikula <jani.nikula@intel.com>

Introduction
============

This document describes the flow and timeline of drm/i915 patches to various
upstream trees.

Rule No. 1
----------

This document is an eternal draft and simply tries to explain the reality of how
drm-intel is maintained. If you observe a difference between these rules and
reality, it is your assumed responsibility to update the rules.

The Relevant Repositories and Branches
======================================

See :ref:`repositories`.

Patch and Merge Flow
====================

This chart describes the flow of patches to drm-intel branches, and the merge
flow of the commits to drm-upstream and Linus' tree.

.. image:: drm-intel-flow.svg

Legend: Green = Linus. Red = drm-upstream. Blue = drm-intel. Black = patches.
Yellow = Additional trees from/shared with other subsystems.

Features
--------

Features are picked up and pushed to drm-intel-next by committers and
maintainers. See :ref:`committer-drm-intel` for details.

Fixes
-----

Fixes are picked up and pushed to drm-intel-next by committers and maintainers,
just like any other patches. This is to ensure fixes are pushed in a timely
manner. Fixes that are relevant for stable, current development kernels, or
drm-next, will be cherry-picked by maintainers to drm-intel-fixes or
drm-intel-next-fixes.

To make this work, patches should be labeled as fixes (see XXX), and extra care
should be put into making fixes the first patches in series, not depending on
preparatory work or cleanup.

Merge Timeline
==============

This chart describes the merge timelines for various branches in terms of one
kernel release cycle. Worth noting is that we're working on two or three kernel
releases at the same time. Big features take a long time to hit a kernel
release. There are no fast paths.

.. include:: drm-intel-timeline.rst

For predictions on the future merge windows and releases, see
http://phb-crystal-ball.org/.
