.. _drm-xe:

======
drm-xe
======

The upstream xe driver repository. Maintained by Thomas Hellström, Lucas De
Marchi, and Rodrigo Vivi, with a large pool of committers. Consists of
``drivers/gpu/drm/xe``, ``include/drm/intel``, and
``include/uapi/drm/xe_drm.h``.

See the `INTEL DRM XE DRIVER`_ and `INTEL DRM DISPLAY FOR XE AND I915 DRIVERS`_
MAINTAINERS entries for current information on maintainers, mailing lists, bug
reporting, etc.

.. _INTEL DRM XE DRIVER: https://docs.kernel.org/process/maintainers.html#intel-drm-xe-driver-lunar-lake-and-newer

.. _INTEL DRM DISPLAY FOR XE AND I915 DRIVERS: https://docs.kernel.org/process/maintainers.html#intel-drm-display-for-xe-and-i915-drivers

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/xe/kernel

drm-xe-next
-----------

This is the branch where all drm/xe patches, both new features and fixes,
are applied.

This branch "hides" the merge window from the drm/xe developers; patches are
applied here regardless of the development phase of Linus' upstream kernel. Pull
requests to :ref:`drm-next` are sent as needed between -rc1 of the current
kernel and the :ref:`drm` feature deadline (-rc5/-rc6 of the current kernel).

drm-xe-next-fixes
-----------------

This branch contains drm/xe specific fixes to :ref:`drm-next` after the drm/xe
features have been merged there. Fixes are first applied to drm-xe-next, and
cherry-picked to drm-xe-next-fixes by maintainers. Valid from :ref:`drm` feature
deadline (-rc5/-rc6 of the current kernel) to -rc1 of the next kernel.

Pull requests to :ref:`drm-next` are sent as needed, with no particular
schedule.

drm-xe-fixes
------------

This branch contains fixes to Linus' tree after :ref:`drm-next` has been merged
during the merge window. The fixes are then merged through :ref:`drm-fixes`.
Valid from -rc1 to the kernel release.

Usually Linus releases each -rc on a Sunday, and drm-xe-fixes gets rebased on
that the following Monday. Usually this is a fast-forward. The pull request to
:ref:`drm-fixes` for new fixes is typically sent on the following Thursday. This
is repeated until final release of the kernel.

This is the fastest path to getting fixes to Linus' tree. It is generally for
the regressions, cc:stable, black screens, GPU hangs only, and should pretty
much follow the stable rules.

topic/core-for-CI
-----------------

This branch contains hotfixes merged last on :ref:`drm-tip` to quickly address
issues originating from outside of the DRM subsystem repositories. Typically
local fixes to issues brought in from a -rc1 kernel, to ensure CI health. They
may also be temporary cherry-picks from other subsystems until the commits hit
the DRM subsystem via normal channels.

See :ref:`topic/core-for-CI` for details.

Patch and Merge Flow
====================

Features
--------

Features are picked up and pushed to drm-xe-next by committers and
maintainers. See :ref:`committer-drm-intel` for details. (The :ref:`drm-intel`
guidelines apply also for drm-xe).

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

topic/xe-for-CI
---------------

The topic/xe-for-CI branch is intended to only hold changes to drm-xe touching
PCI-IDs and firmware version definitions required to get hardware not enabled
in drm-xe-next running in public CI. The patches in this branch must
not in any other way affect behaviour and features in drm-xe-next for
*any* hardware. The topic/xe-for-CI branch may be rebased on
drm-xe-next as needed and force-pushed in the same way as
:ref:`topic/core-for-CI`

Merge Timeline
==============

For predictions on the future merge windows and releases, see
https://jnikula.github.io/linux-kernel-tea-leaves/
