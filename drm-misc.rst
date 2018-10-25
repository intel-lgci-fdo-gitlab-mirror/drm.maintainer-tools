.. _drm-misc:

=========
 drm-misc
=========

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

Maintainer's Duties
===================

Maintainers mostly provide services to keep drm-misc running smoothly:

* Coordinate cross-subsystem dependencies and handle topic branches, sending out
  pull request and merging topic pull requests from other subsystems.

* At least once per week check for pending bugfixes (using ``dim status``) and
  if there are any (either in `-fixes` or `-next-fixes`), send out the pull
  request.

* Fast-forward (when possible) `-fixes` to each released -rc kernel tag, to
  keep it current. We try to avoid backmerges for bugfix branches, and rebasing
  isn't an option with multiple committers.

* Pull requests become noisy if `-fixes` has been fast-forwarded to Linus'
  latest -rc tag but drm-upstream hasn't done the same yet: The shortlog
  will contain not just the queued fixes but also anything else that has
  landed in Linus' tree in the meantime. The best practice is then to base
  the pull request on Linus' master branch (rather than drm-upstream) by
  setting the `upstream` argument for ``dim pull-request`` accordingly.
  Upstream should be warned that they haven't fast-forwarded yet.

* During the merge-window blackout, i.e. from -rc6 on until the merge window
  closes with the release of -rc1, try to track `drm-next` with the
  `-next-fixes` branch. Do not advance past -rc1, otherwise the automagic in
  the scripts will push the wrong patches to the linux-next tree.

* Between -rc1 and -rc6 send pull requests for the `-next` branch every 1-2
  weeks, depending upon how much is queued up.

* Backmerge `drm-next` into the `-next` branch when needed, properly recording
  that reason in the merge commit message. Do a backmerge at least once per
  month to avoid conflict chaos, and specifically merge in the main drm feature
  pull request, to resync with all the late driver submissions during the merge
  window.

* Last resort fallback for applying patches, in case all area expert committers
  are somehow unavailable.

* Take the blame when something goes wrong. Maintainers interface and represent
  the entire group of committers to the wider kernel community.
