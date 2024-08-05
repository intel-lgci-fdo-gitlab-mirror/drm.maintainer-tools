.. _drm:

===
drm
===

The upstream DRM subsystem repository. Maintained by Dave Airlie and Sima
Vetter. Consists mostly of ``drivers/gpu/drm`` and ``include/drm``.

See the `DRM DRIVERS`_ MAINTAINERS entry for current information on maintainers,
mailing lists, bug reporting, etc.

.. _DRM DRIVERS: https://docs.kernel.org/process/maintainers.html#drm-drivers

Introduction
============

drm is the overall graphics subsystem integration tree, and as such works
slightly different from the feature trees managed with :doc:`/dim`:

- Normally only takes pull requests.

- Feature freeze from -rc6 to the end of the merge window, similar to other
  kernel subsystem trees. There's no constantly open feature branch.

- Doesn't have committers, just maintainers, since the pull request load is
  fairly minimal (for now). To keep it that way small trees are encouraged to
  collaborate together in :ref:`drm-misc` or other groups of drivers.

Note that while :ref:`drm-tip` is the ephemeral integration tree, drm is the
permanent integration tree headed for upstream.

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/kernel

.. _drm-next:

drm-next
--------

This is the branch where all new features for the DRM core and all the GPU
drivers, including drm/i915, are merged.

The drm-next branch is closed for new features at around -rc6 timeframe of the
current development kernel in preparation for the upcoming merge window for the
next kernel, when drm-next gets merged to Linus' master. Thus there's a
stabilization period of about 3-5 weeks during which only bug fixes are merged
to drm-next.

.. _drm-fixes:

drm-fixes
---------

This is the branch where all the fixes for the DRM core and all the GPU drivers
for the current development kernels are merged. drm-fixes is usually merged to
Linus' master on a weekly basis.
