=============
Commit Access
=============

The drm-misc and drm-intel repositories operate in a maintainer/committer model
with a large pool committers who can push patches in accordance with the stated
merge criteria, and maintainers handling pull requests, topic branches, merges,
and so on.

This document outlines the requirements for becoming a committer.

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

- Agrees to use their commit rights in accordance with the documented merge
  criteria, tools, processes, and :ref:`code-of-conduct`.

Apply for an account (and any other account change requests) through

https://www.freedesktop.org/wiki/AccountRequests/

and please ping the maintainers if your request is stuck.

Committers are encouraged to request their commit rights get removed when they
no longer contribute to the project. Commit rights will be reinstated when they
come back to the project.

Maintainers and committers should encourage contributors to request commit
rights, especially junior contributors tend to underestimate their skills.

drm-intel and drm-xe
--------------------

The process is similar for both of these repositories/drivers:

- The xe driver, hosted at:

  - Code and issues: https://gitlab.freedesktop.org/drm/xe/kernel
  - Mailing list: https://lists.freedesktop.org/mailman/listinfo/intel-xe
  - IRC channel: #xe on https://www.oftc.net/

- The i915 driver, hosted at:

  - Code and issues: https://gitlab.freedesktop.org/drm/i915/kernel
  - Mailing list: https://lists.freedesktop.org/mailman/listinfo/intel-gfx
  - IRC channel: #intel-gfx on https://www.oftc.net/

Criteria
~~~~~~~~

Commit rights will be granted to anyone who requests them and fulfills the
following criteria:

- Has contributed at least 25 patches to the chosen driver that have already
  been merged upstream. Most of the patches must be non-trivial, not just
  simple spelling or style fixes or code movement.

- Has reviewed at least 25 patches from other developers to the chosen driver
  that have already been merged upstream. Again, most of the reviewed patches
  must be non-trivial.

- Are actively participating in discussions about their work and areas of
  expertise on the project communication channels listed above.

- Has been active in the past year (at least some commits or reviews on the
  chosen driver).

- Will be regularly contributing further patches. This includes regular
  contributors to other parts of the open source graphics stack who only do the
  occasional patch within the driver itself.

- Agrees to use their commit rights in accordance with the documented merge
  criteria, tools, processes, and :ref:`code-of-conduct`.

The above criteria are in place to encourage and require committers are actively
and broadly engaged upstream, and that they are acquainted and comfortable with
the open collaboration model we have. To ensure the committers have enough
experience to gauge reasonably well how much review a patch needs, and whether
it needs acks from domain experts or maintainers before pushing.

Access Request
~~~~~~~~~~~~~~

Make sure you meet the criteria, then please file an issue on the chosen
driver's issue tracker listed above, using the label "Commit access request".
Please ping the maintainers if your request is stuck.

Maintainers may rate limit adding new committers to ensure there's enough
bandwidth to properly support ramp-up on the tools and processes. In this case,
the maintainers will pledge to add at least two new committers per month,
loosely prioritized based on commits, reviews, and in-flight patches.

Committers are encouraged to request their commit rights get removed when they
no longer contribute to the project. Commit rights will be automatically revoked
after a year of inactivity (no commits or reviews). Commit rights will be
reinstated when they come back to the project.

Maintainers and committers should encourage contributors to request commit
rights.
