.. _drm-misc:

========
drm-misc
========

The DRM misc repository. Maintained by Maarten Lankhorst, Maxime Ripard, and
Thomas Zimmermann, with a large pool of committers.

See the main `DRM DRIVERS AND MISC GPU PATCHES`_ MAINTAINERS entry, as well as
all the other MAINTAINERS entries that reference the drm-misc repository, for
current information on maintainers, mailing lists, bug reporting, etc.

.. _DRM DRIVERS AND MISC GPU PATCHES: https://docs.kernel.org/process/maintainers.html#drm-drivers-and-misc-gpu-patches

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

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/misc/kernel

drm-misc-next
-------------

This is the main feature branch where most of the patches land. This branch is
always open to "hide" the merge window from developers. To avoid upsetting
linux-next and causing mayhem in the merge window, in general no pull requests
are sent to upstream after rc6 of the current kernel release. Outside of that
feature freeze period, pull requests are sent to upstream roughly every 1-2
weeks, to avoid too much coordination pains.

If you're unsure, apply your patch here, it can always be cherry-picked to one
of the -fixes branches later on. But in contrast to the drm-intel flow
cherry-picking is not the default.

drm-misc-next-fixes
-------------------

During the time between rc6 of kernel version X and rc1 of X+1, drm-misc-next
will be targeting kernel version X+2 and drm-misc-fixes still targets kernel
version X.  This branch is for fixes to bugs introduced in the drm-misc-next
pull request that was sent for X+1, which aren't present in the drm-misc-fixes
branch.

drm-misc-fixes
--------------

This is for bugfixes which target the current -rc cycle.

Merge Timeline
==============

This chart describes the merge timelines for various branches in terms of one
kernel release cycle. Worth noting is that we're working on two or three kernel
releases at the same time. Big features take a long time to hit a kernel
release. There are no fast paths.

.. include:: drm-misc-timeline.rst
