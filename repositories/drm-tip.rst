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
