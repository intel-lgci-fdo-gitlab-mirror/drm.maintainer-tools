.. _maintainer-drm-misc:

================================
 drm-misc Maintainer Guidelines
================================

This document describes the detailed maintainer tasks for drm-misc.

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
