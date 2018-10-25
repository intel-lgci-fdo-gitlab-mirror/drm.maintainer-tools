.. _committer-drm-misc:

===============================
 drm-misc Committer Guidelines
===============================

This document describes the detailed merge criteria and committer guidelines for
drm-misc. The same criteria and guidelines apply equally to both committers and
maintainers.

Where Do I Apply My Patch?
==========================

Consult this handy flowchart to determine the best branch for your patch. If in
doubt, apply to drm-misc-next or ask your favorite maintainer on IRC.

.. image:: drm-misc-commit-flow.svg

Merge Criteria
==============

Right now the only hard merge criteria are:

* Patch is properly reviewed or at least Ack, i.e. don't just push your own
  stuff directly. This rule holds even more for bugfix patches - it would be
  embarrassing if the bugfix contains a small gotcha that review would have
  caught.

* drm-misc is for drm core (non-driver) patches, subsystem-wide refactorings,
  and small trivial patches all over (including drivers). For a detailed list of
  what's all maintained in drm-misc grep for "drm-misc" in MAINTAINERS.

* Larger features can be merged through drm-misc too, but in some cases
  (especially when there are cross-subsystem conflicts) it might make sense to
  merge patches through a dedicated topic tree. The dim_ tooling has full
  support for them, if needed.

* Any non-linear actions (backmerges, merging topic branches and sending out
  pull requests) are only done by the official drm-misc maintainers (see
  MAINTAINERS, or ask #dri-devel), and not by committers. See the
  `examples section in dim <dim.html#examples>`_ for more info

* All the x86, arm and arm64 DRM drivers need to still compile. To simplify this
  we track defconfigs for all three platforms in the `rerere-cache` branch.

* The goal is to also pre-check everything with CI. Unfortunately neither the
  arm side (using kernelci.org and generic i-g-t tests) nor the Intel side
  (using Intel CI infrastructure and the full i-g-t suite) is yet fully ready
  for production.

* No rebasing out mistakes, because this is a shared tree.

* See also the extensive :ref:`committer-drm-intel`.

Small Drivers
=============

Small drivers, where a full tree is overkill, can be maintained in
drm-misc. Slightly different rules apply:

* Small is measured in patches merged per kernel release. The occasional big
  patch series is still acceptable if it's not a common thing (e.g. new hw
  enabling once a year), and if the series is really big (more than 20 patches)
  it should probably be managed through a topic branch in drm-misc and with a
  separate pull request to drm maintainer. dim_ supports this with the
  create-branch command. Everything that doesn't justify a topic branch goes
  into the normal drm-misc branches directly.

* Group maintainership is assumed, i.e. all regular contributors (not just
  the primary maintainer) will get commit rights.

* Since even a broken driver is more useful than no driver minimal review
  standards are a lot lower. The default should be some notes about what could
  be improved in follow-up work and accepting patches by default. Maintainer
  group for drivers can agree on stricter rules, especially when they have a
  bigger user base that shouldn't suffer from regressions.

* Minimal peer-review is also expected for drivers with just one contributor,
  but obviously then only focuses on best practices for the interaction with drm
  core and helpers. Plus a bit looking for common patterns in dealing with the
  hardware, since display IP all has to handle the same issues in the end. In
  most cases this will just along the lines of "Looks good, Ack".  drm-misc
  maintainers will help out with getting that review market going.

* Best practice for review: When you have some suggestions and comments for
  future work, please make sure you don't forget your Ack tag to unblock the
  original patch. And if you think something really must be fixed before
  merging, please give a conditional Ack along the lines of "Fix
  $specific_thing, with that addressed, Ack". The goal is to always have a clear
  and reasonable speedy path towards getting the patch merged. For authors on
  the other side, just do the minimal rework and push the patch, and do any
  more involved rework in follow-up work. This way lengthy review cycles get
  avoided, which are a drag for both reviewer and author.

Tooling
=======

drm-misc git repositories are managed with dim_.

.. _dim: dim.html
