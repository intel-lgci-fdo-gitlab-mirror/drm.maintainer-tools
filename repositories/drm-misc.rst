.. _drm-misc:

========
drm-misc
========

-------------------------------------------------------------
drm-misc patch and upstream merge flow and timeline explained
-------------------------------------------------------------

This document describes the flow and timeline of misc drm and gpu patches to
various upstream trees. For a detailed list of what's all maintained in drm-misc
grep for "drm-misc" in MAINTAINERS.

Rule No. 1
==========

This document is an eternal draft and simply tries to explain the reality of how
drm-misc is maintained. If you observe a difference between these rules and
reality, it is your assumed responsibility to update the rules.

The workflow is heavily based upon the one used to maintain the Intel drm
driver, see `drm-intel <drm-intel.html>`_:

Getting Started
===============

First you need a `freedesktop.org account with the drm-misc group permission
<https://www.freedesktop.org/wiki/AccountRequests/>`_. Then you need to setup the
branches and tooling, see :ref:`getting-started`.

Branches
========

See :ref:`drm-misc-repository`.

Merge Timeline
~~~~~~~~~~~~~~

This chart describes the merge timelines for various branches in terms of one
kernel release cycle. Worth noting is that we're working on two or three kernel
releases at the same time. Big features take a long time to hit a kernel
release. There are no fast paths.

.. include:: drm-misc-timeline.rst
