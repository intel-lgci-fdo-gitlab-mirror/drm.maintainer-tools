.. _repositories:

=========================
Repositories and Branches
=========================

All the relevant repositories and branches are described below. For the current
list of maintainers, mailing lists, etc. please refer to MAINTAINERS_.

.. _MAINTAINERS: https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/MAINTAINERS

.. contents::

The Upstream Linux Kernel Repository
------------------------------------

See upstream_ for repository details. Maintained by Linus Torvalds.

.. _upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

master
~~~~~~

Linus' master, the upstream, or mainline. This is where all features from all
subsystems, including DRM and i915, are merged.

The upstream follows a single branch, time-based development model, with a new
kernel release occurring roughly every 10 weeks. New features are merged from
subsystem trees during the two week merge window immediately following a kernel
release. After the merge window, the new development kernel is stabilized by
only merging fixes until the next kernel release. During development, there's a
new release candidate (-rc) kernel each week.

The Upstream DRM Subsystem Repository
-------------------------------------

See :ref:`drm` and `drm upstream`_ for repository details. Maintained by Dave
Airlie of Red Hat. Consists mostly of ``drivers/gpu/drm`` and ``include/drm``.

.. _drm upstream: https://gitlab.freedesktop.org/drm/kernel

drm-next
~~~~~~~~

This is the branch where all new features for the DRM core and all the GPU
drivers, including drm/i915, are merged.

The drm-next branch is closed for new features at around -rc5 timeframe of the
current development kernel in preparation for the upcoming merge window for the
next kernel, when drm-next gets merged to Linus' master. Thus there's a
stabilization period of about 3-5 weeks during which only bug fixes are merged
to drm-next.

drm-fixes
~~~~~~~~~

This is the branch where all the fixes for the DRM core and all the GPU drivers
for the current development kernels are merged. drm-fixes is usually merged to
Linus' master on a weekly basis.

.. _drm-misc-repository:

The DRM Misc Repository
-----------------------

See :ref:`drm-misc` and `the drm-misc repository`_ for repository
details. Maintained by Maarten Lankhorst, Maxime Ripard, and Thomas Zimmermann, with a
large pool of committers.

.. _the drm-misc repository: https://gitlab.freedesktop.org/drm/misc/kernel

drm-misc-next
~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~~

During the time between rc6 of kernel version X and rc1 of X+1, drm-misc-next
will be targeting kernel version X+2 and drm-misc-fixes still targets kernel
version X.  This branch is for fixes to bugs introduced in the drm-misc-next
pull request that was sent for X+1, which aren't present in the drm-misc-fixes
branch.

drm-misc-fixes
~~~~~~~~~~~~~~

This is for bugfixes which target the current -rc cycle.

.. _drm-intel-repository:

The Upstream i915 Driver Repository
-----------------------------------

See :ref:`drm-intel` and `the drm-intel repository`_ for repository
details. Maintained by Jani Nikula, Joonas Lahtinen and Rodrigo Vivi, with a
large pool of committers. Consists mostly of ``drivers/gpu/drm/i915`` and
``include/drm/i915_*.h``.

.. _the drm-intel repository: https://gitlab.freedesktop.org/drm/i915/kernel

drm-intel-next (aka "din") and drm-intel-gt-next (aka "dign")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These are the branches where all drm/i915 patches, both new features and fixes,
are applied.

drm-intel-gt-next is for gem/gt code, and drm-intel-next is for everything else,
including i915 driver core and display.

These branches "hide" the merge window from the drm/i915 developers; patches are
applied here regardless of the development phase of Linus' upstream kernel. Pull
requests to drm-next are sent as needed between -rc1 of the current kernel and
the drm feature deadline (-rc5/-rc6 of the current kernel).

Note that drm-intel-next may be cross-merged directly to drm-intel-gt-next, but
not vice versa. Syncing drm-intel-gt-next changes back to drm-intel-next must
happen via a pull request to drm-next and a backmerge to drm-intel-next.

drm-intel-next-fixes (aka "dinf")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This branch contains drm/i915 specific fixes to drm-next after the drm/i915
features have been merged there. Fixes are first applied to drm-intel-next, and
cherry-picked to drm-intel-next-fixes by maintainers. Valid from drm feature
deadline (-rc5/-rc6 of the current kernel) to -rc1 of the next kernel.

Pull requests to drm-next are sent as needed, with no particular schedule.

drm-intel-fixes (aka "-fixes")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This branch contains fixes to Linus' tree after drm-next has been merged during
the merge window. Fixes are first applied to drm-intel-next, and cherry-picked
to drm-intel-fixes by maintainers. The fixes are then merged through drm-fixes.
Valid from -rc1 to the kernel release.

Usually Linus releases each -rc on a Sunday, and drm-intel-fixes gets rebased on
that the following Monday. Usually this is a fast-forward. The pull request to
drm-fixes for new fixes is typically sent on the following Thursday. This is
repeated until final release of the kernel.

This is the fastest path to getting fixes to Linus' tree. It is generally for
the regressions, cc:stable, black screens, GPU hangs only, and should pretty
much follow the stable rules.

The Upstream xe Driver Repository
-----------------------------------

See  :ref:`drm-xe` and `the drm-xe repository`_ for repository
details. Maintained by Oded Gabbay, Thomas Hellström and Lucas De Marchi, with a
large pool of committers. Consists of ``drivers/gpu/drm/xe``,
``include/drm/xe_*.h`` and ``include/uapi/drm/xe_drm.h``.

.. _the drm-xe repository: https://gitlab.freedesktop.org/drm/xe/kernel

drm-xe-next
~~~~~~~~~~~

This is the branch where all drm/xe patches, both new features and fixes,
are applied.

This branch "hides" the merge window from the drm/xe developers; patches are
applied here regardless of the development phase of Linus' upstream kernel. Pull
requests to drm-next are sent as needed between -rc1 of the current kernel and
the drm feature deadline (-rc5/-rc6 of the current kernel).

drm-xe-next-fixes
~~~~~~~~~~~~~~~~~

This branch contains drm/xe specific fixes to drm-next after the drm/xe
features have been merged there. Fixes are first applied to drm-xe-next, and
cherry-picked to drm-xe-next-fixes by maintainers. Valid from drm feature
deadline (-rc5/-rc6 of the current kernel) to -rc1 of the next kernel.

Pull requests to drm-next are sent as needed, with no particular schedule.

drm-xe-fixes
~~~~~~~~~~~~

This branch contains fixes to Linus' tree after drm-next has been merged during
the merge window. The fixes are then merged through drm-fixes.
Valid from -rc1 to the kernel release.

Usually Linus releases each -rc on a Sunday, and drm-xe-fixes gets rebased on
that the following Monday. Usually this is a fast-forward. The pull request to
drm-fixes for new fixes is typically sent on the following Thursday. This is
repeated until final release of the kernel.

This is the fastest path to getting fixes to Linus' tree. It is generally for
the regressions, cc:stable, black screens, GPU hangs only, and should pretty
much follow the stable rules.

topic/core-for-CI
~~~~~~~~~~~~~~~~~

This branch contains hotfixes merged last on drm-tip to quickly address issues
originating from outside of the DRM subsystem repositories. Typically local
fixes to issues brought in from a -rc1 kernel, to ensure CI health. They may
also be temporary cherry-picks from other subsystems until the commits hit the
DRM subsystem via normal channels.

See :ref:`topic/core-for-CI` for details.

The DRM Testing and Integration Repository
------------------------------------------

See :ref:`drm-tip` and `the drm-tip repository`_ for repository details.

.. _the drm-tip repository: https://gitlab.freedesktop.org/drm/tip

drm-tip
~~~~~~~

This is the overall integration tree for drm, and lives in
``https://gitlab.freedesktop.org/drm/tip.git``. Every time one of the above
branches is updated drm-tip gets rebuilt. If there's a conflict see section on
`resolving conflicts when rebuilding drm-tip
<drm-tip.html#resolving-conflicts-when-rebuilding-drm-tip>`_.

drm-rerere
~~~~~~~~~~

This branch contains the `nightly.conf`_ configuration file and the shared ``git
rerere`` conflict resolutions for dim to generate drm-tip, as well as some
kernel defconfig files for build testing.

.. _nightly.conf: https://gitlab.freedesktop.org/drm/tip/-/blob/rerere-cache/nightly.conf

The Maintainer Tools Repository
-------------------------------

This repository contains all the tools and documentation you're reading
about. See the `project home page`_ for more details.

.. _project home page: https://gitlab.freedesktop.org/drm/maintainer-tools/
