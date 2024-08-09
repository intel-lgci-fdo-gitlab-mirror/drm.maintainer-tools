.. _topic/core-for-CI:

=============================
Hotfixes in topic/core-for-CI
=============================

While the topic/core-for-CI branch lives in :ref:`drm-intel`, it's primarily
relevant for :ref:`drm-tip`. It's merged to :ref:`drm-tip` in `nightly.conf`_
after the feature and fixes branches, and mostly contains hotfixes to unblock
the `Intel CI`_ pending proper fixes. A typical example is a patch or a
cherry-pick from another subsystem to an issue showing up in -rc1, while waiting
for the fix to show up in the DRM subsystem via regular merges.

.. _nightly.conf: https://gitlab.freedesktop.org/drm/tip/-/blob/rerere-cache/nightly.conf

.. _Intel CI: https://intel-gfx-ci.01.org/

Access
======

Anyone with :ref:`drm-intel` commit access has access to rebase, add, and remove
commits. Please follow the directions below.

Rebasing
========

topic/core-for-CI is a rebasing and force pushed branch. Please rebase it on top
of Linus' release or -rc tags. Rebasing on top of :ref:`drm-next` should be a
rare, justified exception. The primary goal is to fix issues originating from
:ref:`upstream`. Issues that would need :ref:`drm-next` or other DRM subsystem
tree as baseline should be fixed in the offending DRM subsystem tree.

Only rebase the branch if you really know what you're doing. You'll need to be
able to handle any conflicts in non-drm code while rebasing.

Always ask for maintainer ack before rebasing. IRC ack is sufficient.

Simply drop fixes that are already available in the new baseline. Close the
associated gitlab issue when removing commits.

Force pushing a rebased topic/core-for-CI requires passing the ``--force``
parameter to git::

  $ dim push-branch topic/core-for-CI --force

You may also need to pass ``-f`` to :ref:`dim`::

  $ dim -f push-branch topic/core-for-CI --force

Adding and Removing Commits
===========================

Preferrably send a patch or a revert with subject prefix "[topic/core-for-CI]"
to the intel-gfx and/or intel-xe mailing lists to get the CI results on the
change. However, in some cases, a direct push may be required to get CI back
online ASAP. It's a judgement call.

Only add or remove commits if you really know what you're doing. When in doubt,
ask the maintainers.

Always ask for maintainer/committer ack before adding/removing commits. IRC ack
is sufficient. Record the ``Acked-by:`` in commits being added.

Apply new commits on top with regular push. The commit message must explain why
the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
another subsystem, please reference the commit with ``git cherry-pick -x``
option. If it's a patch from another subsystem, please reference the patch on
the mailing list with ``Link:`` tag.

New commits always need an associated gitlab issue for tracking purposes. The
goal is to have as few commits in topic/core-for-CI as possible, and we need to
be able to track the progress in making that happen. Reference the issue with
``References:`` tag. Add the ``core-for-CI`` label to the issue. (Note: Do not
use ``Closes:`` because the logic here is backwards; the issue is having the
commit in the branch in the first place.)

Instead of applying reverts, you may also just remove the commit. This implies
``git rebase -i`` on the current baseline; see directions above. Close the
associated gitlab issue when removing/reverting commits.
