=============
Commit Access
=============

The :ref:`drm-misc`, :ref:`drm-intel`, and :ref:`drm-xe` repositories operate in
a maintainer/committer model with a large pool committers who can push patches
in accordance with the stated merge criteria, and maintainers handling pull
requests, topic branches, merges, and so on.

This document outlines the requirements for becoming a committer, and how to
apply for access.

Criteria
========

The repositories have slightly different criteria as described below.

drm-misc
--------

Commit rights will be granted to anyone who requests them and fulfills the
below criteria:

- Submitted a few (5-10 as a rule of thumb) non-trivial (not just simple
  spelling fixes and whitespace adjustment) patches that have been merged
  already.

- Are actively participating on discussions about their work (on the mailing
  list or IRC). This should not be interpreted as a requirement to review other
  peoples patches but just make sure that patch submission isn't one-way
  communication. Cross-review is still highly encouraged.

- Will be regularly contributing further patches. This includes regular
  contributors to other parts of the linux kernel or the open source graphics
  stack who only do the oddball rare patch within drm-misc itself.

- Agrees to use their commit rights in accordance with the documented
  :ref:`committer-drm-misc`, merge criteria, tools, processes, and
  :ref:`code-of-conduct`.

drm-intel and drm-xe
--------------------

Commit rights will be granted to anyone who requests them and fulfills the
following criteria:

- Has contributed at least 25 patches to the chosen driver that have already
  been merged upstream. Most of the patches must be non-trivial, not just
  simple spelling or style fixes or code movement.

- Has reviewed at least 25 patches from other developers to the chosen driver
  that have already been merged upstream. Again, most of the reviewed patches
  must be non-trivial.

- Are actively participating in discussions about their work and areas of
  expertise on the project communication channels (mailing list, IRC).

- Has been active in the past year (at least some commits or reviews on the
  chosen driver).

- Will be regularly contributing further patches. This includes regular
  contributors to other parts of the open source graphics stack who only do the
  occasional patch within the driver itself.

- Agrees to use their commit rights in accordance with the documented
  :ref:`committer-drm-intel`, merge criteria, tools, processes, and
  :ref:`code-of-conduct`.

The above criteria are in place to encourage and require committers are actively
and broadly engaged upstream, and that they are acquainted and comfortable with
the open collaboration model we have. To ensure the committers have enough
experience to gauge reasonably well how much review a patch needs, and whether
it needs acks from domain experts or maintainers before pushing.

Access Request
==============

The first step is to `create a gitlab.freedesktop.org account`_ unless you
already have one.

Request commit access (or any other permission changes) by creating an access
request issue on the repository:

* `drm-misc access request`_

* `drm-intel access request`_

* `drm-xe access request`_

Please ping the maintainers if your request gets stuck.

Committers are encouraged to request their commit rights get removed when they
no longer contribute to the project. Commit rights may be automatically revoked
after a year of inactivity (no commits or reviews). Commit rights will be
reinstated when they come back to the project.

Maintainers and committers should encourage contributors to request commit
rights, especially junior contributors tend to underestimate their skills.

.. _create a gitlab.freedesktop.org account: https://gitlab.freedesktop.org/users/sign_up

.. _drm-misc access request: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new?issue[title]=Request%20for%20Commit%20Rights&issuable_template=commit_access

.. _drm-intel access request: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/new?issue[title]=Request%20for%20Commit%20Rights&issuable_template=commit_access

.. _drm-xe access request: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/new?issue[title]=Request%20for%20Commit%20Rights&issuable_template=commit_access
