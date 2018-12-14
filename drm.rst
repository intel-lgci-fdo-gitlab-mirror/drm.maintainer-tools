drm
===

Introduction
------------

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

Backmerges
----------

All backmerges for `-next` trees should first land in `drm-next`, with an
explicit merge commit.  This includes pull requests from driver trees based on
newer upstream. In that case first apply the backmerge, then take the pull
request.

Only exception is right after -rc1 when `drm-next` reopens for features, where a
fast-forward is all that's needed.

Only backmerge tagged releases.

Pull Request Review
-------------------

Special care should be taken to review commits which:

- Touch files outside of what the maintainer maintains (drm core code, other
  drivers, or even other subsystems).

- Not reviewed patches - occasionally the lack of review is a process fumble and
  patches never even made it to any list.

- Changing uapi. Look both for include/uapi and anything adding new KMS
  properties.

- Check for last-minute rebases (all the patches have roughly the same commit
  timestamp). Especially rebasing onto latest upstream right before sending out
  is discouraged by Linus (since it invalidates the testing that happened).

FIXME: Script as much as possible of the above.

Opens
-----

- Lots of the above needs to be discussed.

- Hard rule against being both drm and sub-tree maintainer, to prevent glaring
  conflicts of interest? Commit rights for Dave in drm-misc?

- To rebase or not to rebase (probably no, except the tree is on fire)

- Recipient list for pulls to Linus (Daniel botched this, should be scripted?)
