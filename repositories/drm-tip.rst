.. _drm-tip:

=======
drm-tip
=======

The drm-tip branch (in the drm-tip repository) is the common DRM subsystem
testing and integration tree (or "pile" to complete the reverse acronym). It's a
bit like linux-next for graphics. It gets rebuilt every time one of the branches
maintained using dim is updated.

It should be emphasized that no patch ever gets pushed to drm-tip directly,
drm-tip is not upstream per se, and no pull requests are ever sent to or from
drm-tip. It is, however, the merge result of a number of upstream branches like
that. It is the combined bleeding edge of kernel graphics.

The drm-rerere branch contains the `nightly.conf`_ configuration file that
describes the branches that get merged to drm-tip, as well as shared conflict
resolution for merging the branches on drm-tip rebuild.

.. _nightly.conf: https://gitlab.freedesktop.org/drm/tip/-/blob/rerere-cache/nightly.conf

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/tip

drm-tip
-------

This is the overall integration tree for drm, and lives in
``https://gitlab.freedesktop.org/drm/tip.git``. Every time one of the above
branches is updated drm-tip gets rebuilt. If there's a conflict see section on
`resolving conflicts when rebuilding drm-tip
<drm-tip.html#resolving-conflicts-when-rebuilding-drm-tip>`_.

drm-rerere
----------

This branch contains the `nightly.conf`_ configuration file and the shared ``git
rerere`` conflict resolutions for dim to generate drm-tip, as well as some
kernel defconfig files for build testing.

.. _nightly.conf: https://gitlab.freedesktop.org/drm/tip/-/blob/rerere-cache/nightly.conf

.. _topic/core-for-CI:

Hotfixes in topic/core-for-CI
=============================

While the topic/core-for-CI branch lives in :ref:`drm-intel`, it's
primarily relevant for drm-tip. It's merged to drm-tip in `nightly.conf`_ after
the feature and fixes branches, and mostly contains hotfixes to unblock the
`Intel CI`_ pending proper fixes. A typical example is a patch or a cherry-pick
from another subsystem to an issue showing up in -rc1, while waiting for the fix
to show up in the DRM subsystem via regular merges.

.. _Intel CI: https://intel-gfx-ci.01.org/

Access
------

Anyone with drm-intel commit access has access to rebase, add, and remove
commits. Please follow the directions below.

Rebasing
--------

topic/core-for-CI is a rebasing and force pushed branch. Please rebase it on top
of Linus' release or -rc tags. Rebasing on top of drm-next should be a rare,
justified exception. The primary goal is to fix issues originating from Linus'
tree. Issues that would need drm-next or other DRM subsystem tree as baseline
should be fixed in the offending DRM subsystem tree.

Only rebase the branch if you really know what you're doing. You'll need to be
able to handle any conflicts in non-drm code while rebasing.

Always ask for maintainer ack before rebasing. IRC ack is sufficient.

Simply drop fixes that are already available in the new baseline. Close the
associated gitlab issue when removing commits.

Force pushing a rebased topic/core-for-CI requires passing the ``--force``
parameter to git::

  $ dim push-branch topic/core-for-CI --force

Adding and Removing Commits
---------------------------

Preferrably send a patch or a revert with subject prefix "[topic/core-for-CI]"
to the intel-gfx mailing list to get the CI results on the change. However, in
some cases, a direct push may be required to get CI back online ASAP. It's a
judgement call.

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

Instead of applying reverts, just remove the commit. This implies ``git rebase
-i`` on the current baseline; see directions above. Close the associated gitlab
issue when removing commits.
