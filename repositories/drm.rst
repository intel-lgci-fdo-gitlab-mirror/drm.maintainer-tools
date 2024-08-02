.. _drm:

===
drm
===

The upstream DRM subsystem repository. Maintained by Dave Airlie and Sima
Vetter. Consists mostly of ``drivers/gpu/drm`` and ``include/drm``.

Introduction
============

drm is the overall graphics integration tree, and as such works slightly
differently than feature trees managed with dim_:

- Normally only takes pull requests.

- Freezes for features from -rc6 to the end of the merge window as kernel
  subsystem trees usually do. There`s no constantly open feature branch. After
  -rc6 `drm-next` only accepts bugfixes and smaller cleanups aimed for the merge
  window.

- Doesn`t have committers, just maintainers, since the pull request load is
  fairly minimal (for now). To keep it that way small trees are encouraged to
  collaborate together in drm-misc or other groups of drivers.

.. _dim: dim.html

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/kernel

drm-next
--------

This is the branch where all new features for the DRM core and all the GPU
drivers, including drm/i915, are merged.

The drm-next branch is closed for new features at around -rc5 timeframe of the
current development kernel in preparation for the upcoming merge window for the
next kernel, when drm-next gets merged to Linus' master. Thus there's a
stabilization period of about 3-5 weeks during which only bug fixes are merged
to drm-next.

drm-fixes
---------

This is the branch where all the fixes for the DRM core and all the GPU drivers
for the current development kernels are merged. drm-fixes is usually merged to
Linus' master on a weekly basis.
