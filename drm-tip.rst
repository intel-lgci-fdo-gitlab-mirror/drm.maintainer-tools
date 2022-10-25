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

.. _nightly.conf: https://cgit.freedesktop.org/drm/drm-tip/plain/nightly.conf?h=rerere-cache

Resolving Conflicts when Rebuilding drm-tip
===========================================

When you push patches with dim drm-tip always gets rebuilt and this can
sometimes fail, for example like this::

        Updating rerere cache and nightly.conf... Done.
        Fetching drm-upstream... Done.
        Fetching origin... Done.
        Fetching sound-upstream... Done.
        Merging origin/drm-intel-fixes... Reset. Done.
        Merging drm-upstream/drm-fixes... Fast-forward. Done.
        Merging origin/drm-intel-next-fixes... Done.
        Merging origin/drm-intel-next... ++<<<<<<< HEAD
        ++=======
        ++>>>>>>> origin/drm-intel-next
        Fail: conflict merging origin/drm-intel-next

Often it's very easy to resolve such conflicts, but maintainers can take over
when it's tricky or something fails in the below procedure.

1. First check that drm-intel-next was indeed pushed correctly and that your
   local and remote branches match.

2. Then rebuild the integration branch just to confirm::

        $ dim rebuild-tip

   It's handy to keep the log output for context so that you know which branch
   caused the conflicts, and which branches are already included.

3. Switch to $DIM_PREFIX/drm-tip and analyze the conflict::

        $ cd $DIM_PREFIX/drm-tip
        $ git diff # shows three-way diff of conflict
        $ gitk --merge # lists all commits git believes to be relevant

   If the conflict is simple and created by one of the patches you pushed fix
   things up and compile/test the resulting kernel. In case of doubt just ping
   authors of other patches or maintainers on IRC.

4. When you're happy with the resolution commit it with::

        $ git commit -a

   git will then store the conflict resolution internally (see git help rerere
   for how this is implemented). Then re-run drm-tip generation to confirm the
   resolution has been captured correctly by git (sometimes git rerere can't
   match up your resolution with the conflict for odd reasons) and to make sure
   there's no other conflict in later merges::

        $ dim rebuild-tip

   This will also push the stored conflict resolution to the drm-intel-rerere
   branch and therefore publishes your resolution. Everything before this step
   has just local effects.

And if any step fails or the conflict is tricky just ping maintainers.

Removing a Wrong Conflict Resolution
------------------------------------

Occasionally someone screws up and pushes a broken merge conflict resolution to
drm-tip. Getting rid of that requires a few steps.

1. First identify which commit in the drm-rerere branch contains the bad merge
   resolution. If you know who pushed the bad merge then searching by author is
   easiest, otherwise figure out which stored resolution is the wrong one.

2. Revert that commit and make sure there's no other cache resolutions around::

      $ cd $DIM_PREFIX/drm-rerere
      $ git pull # to avoid conflicts with others
      $ git revert $broken_resolution_sha1
      $ git clean -dfx

3. Re-resolve the conflict and try to get it right this time around::

      $ dim rebuild-tip

If the Conflict Reappears
-------------------------

In some odd cases git rerere fails to recognize the conflict, and doesn't
reapply the stored conflict resolution. This needs to be handled with a manual
fixup patch, and the best way to go about this is:

1. Try to resolve the conflict normally, but then running::

       $ dim rebuild-tip

   fails. First, store the current state, including the conflict markers and
   with no other changes applied::

       $ cd $DIM_PREFIX/drm-tip
       $ git add -u
       $ git commit

2. Resolve the conflict normally, but don't stage it or commit it in any
   fashion. Check that the resolution looks correct and removes all the conflict
   markers you've just committed::

       $ git diff

   Then store it as a manual fixup patch::

       $ git diff | dim cat-to-fixup

3. Finally rebuild the integration tree, which should now go through
   smoothly, at least for this merge::

       $ dim rebuild-tip

Anytime you add or change a manual merge fixup please inform the maintainers of
both involved trees so that they are aware of the situation and can consider
resolving the conflict permantly with a backmerge or pull.

Fixing Silent Conflicts
-----------------------

A really annoying case is when a merge has a silent conflict, i.e. git merge
succeeds, but the resulting source fails to compile or run. Often this happens
when one branch changes a function or structure, while a 2nd branch adds a new
user. The important part is to make sure we supply the fixup patch for the right
merge commit.

1. Identify the merge that breaks the build.

2. Rebuild drm-tip in interactive mode, and stop after the broken merge has been
   done::

      $ dim -i rebuild-tip

   Interrupt the rebuilding of drm-tip by hitting ^C when it asks you to hit a
   key to proceed.

3. Resolve the conflict normally, but don't stage it or commit it in any
   fashion. Check that the resolution looks correct::

       $ git diff

   Of course also make sure it actually builds/works. Then store it as a manual fixup patch::

       $ git diff | dim cat-to-fixup

4. Finally rebuild the integration tree, which should now result in a working
   tree with no broken merges::

       $ dim rebuild-tip

Anytime you add or change a manual merge fixup please inform the maintainers of
both involved trees so that they are aware of the situation and can consider
resolving the conflict permantly with a backmerge or pull.

.. _topic/core-for-CI:

Hotfixes in topic/core-for-CI
=============================

While the topic/core-for-CI branch lives in :ref:`drm-intel-repository`, it's
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
