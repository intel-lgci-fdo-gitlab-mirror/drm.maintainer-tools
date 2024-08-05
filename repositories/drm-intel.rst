.. _drm-intel:

=========
drm-intel
=========

The upstream i915 driver repository. Maintained by Jani Nikula, Joonas Lahtinen,
Rodrigo Vivi, and Tvrtko Ursulin, with a large pool of committers. Consists
mostly of ``drivers/gpu/drm/i915`` and ``include/drm/intel``.

See the `INTEL DRM I915 DRIVER`_ and `INTEL DRM DISPLAY FOR XE AND I915
DRIVERS`_ MAINTAINERS entries for current information on maintainers, mailing
lists, bug reporting, etc.

.. _INTEL DRM I915 DRIVER: https://docs.kernel.org/process/maintainers.html#intel-drm-i915-driver-meteor-lake-dg2-and-older-excluding-poulsbo-moorestown-and-derivative

.. _INTEL DRM DISPLAY FOR XE AND I915 DRIVERS: https://docs.kernel.org/process/maintainers.html#intel-drm-display-for-xe-and-i915-drivers

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/i915/kernel

drm-intel-next (aka "din") and drm-intel-gt-next (aka "dign")
-------------------------------------------------------------

These are the branches where all drm/i915 patches, both new features and fixes,
are applied.

drm-intel-gt-next is for gem/gt code, and drm-intel-next is for everything else,
including i915 driver core and display.

These branches "hide" the merge window from the drm/i915 developers; patches are
applied here regardless of the development phase of Linus' upstream kernel. Pull
requests to :ref:`drm-next` are sent as needed between -rc1 of the current
kernel and the :ref:`drm` feature deadline (-rc5/-rc6 of the current kernel).

Note that drm-intel-next may be cross-merged directly to drm-intel-gt-next, but
not vice versa. Syncing drm-intel-gt-next changes back to drm-intel-next must
happen via a pull request to drm-next and a backmerge to drm-intel-next.

drm-intel-next-fixes (aka "dinf")
---------------------------------

This branch contains drm/i915 specific fixes to :ref:`drm-next` after the
drm/i915 features have been merged there. Fixes are first applied to
drm-intel-next, and cherry-picked to drm-intel-next-fixes by maintainers. Valid
from :ref:`drm` feature deadline (-rc5/-rc6 of the current kernel) to -rc1 of
the next kernel.

Pull requests to drm-next are sent as needed, with no particular schedule.

drm-intel-fixes (aka "-fixes")
------------------------------

This branch contains fixes to Linus' tree after drm-next has been merged during
the merge window. Fixes are first applied to drm-intel-next, and cherry-picked
to drm-intel-fixes by maintainers. The fixes are then merged through drm-fixes.
Valid from -rc1 to the kernel release.

Usually Linus releases each -rc on a Sunday, and drm-intel-fixes gets rebased on
that the following Monday. Usually this is a fast-forward. The pull request to
:ref:`drm-fixes` for new fixes is typically sent on the following Thursday. This
is repeated until final release of the kernel.

This is the fastest path to getting fixes to Linus' tree. It is generally for
the regressions, cc:stable, black screens, GPU hangs only, and should pretty
much follow the stable rules.

Patch and Merge Flow
====================

This chart describes the flow of patches to drm-intel branches, and the merge
flow of the commits to :ref:`drm` and :ref:`upstream`.

.. graphviz:: drm-intel-flow.dot

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
