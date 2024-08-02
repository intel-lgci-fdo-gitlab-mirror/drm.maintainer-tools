.. _drm-tip:

=======
drm-tip
=======

The DRM subsystem configuration and integration repository.

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/tip

drm-tip
-------

The drm-tip branch is the common DRM subsystem testing and integration tree (or
"pile" to complete the reverse acronym). It's a bit like linux-next for
graphics. It gets automatically rebuilt and pushed every time one of the
branches maintained using :doc:`/dim` is updated.

It should be emphasized that no patch ever gets pushed to drm-tip directly,
drm-tip is not upstream per se, and no pull requests are ever sent to or from
drm-tip. It is, however, the merge result of a number of upstream branches like
that. It is the combined bleeding edge of kernel graphics.

It is generally recommended to do graphics subsystem development on top of
drm-tip.

drm-rerere
----------

The drm-rerere branch contains the `nightly.conf`_ configuration file that
describes the repositories and branches managed by :doc:`/dim` that get merged
to drm-tip, the shared `git rerere`_ conflict resolutions for :doc:`/dim` to
generate drm-tip, as well as some kernel defconfig files for build testing.

.. _nightly.conf: https://gitlab.freedesktop.org/drm/tip/-/blob/rerere-cache/nightly.conf

.. _git rerere: https://git-scm.com/docs/git-rerere
