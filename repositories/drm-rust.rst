.. _drm-rust:

========
drm-rust
========

The DRM Rust repository. Maintained by Alice Ryhl and Danilo Krummrich, with a
pool of committers.

This repository consists mostly of the core :ref:`drm` Rust code as well as Rust
DRM drivers.

The main purpose of `drm-rust`_ is to provide a shared tree for all DRM Rust
development. This way the drivers in development, such as nova-core, nova-drm,
Tyr and rvkms can easily share newly introduced infrastructure within the same
release cycle, which eases and accelerates development.

See the main `DRM RUST INFRASTRUCTURE AND DRIVERS`_ MAINTAINERS entry, as well
as all the other MAINTAINERS entries that reference the drm-rust repository, for
current information on maintainers, mailing lists, bug reporting, etc.

.. _DRM RUST INFRASTRUCTURE AND DRIVERS: https://docs.kernel.org/process/maintainers.html#drm-rust-infrastructure-and-drivers

Repository and Branches
=======================

https://gitlab.freedesktop.org/drm/rust/kernel

drm-rust-next
-------------

This is the main feature branch where most of the patches land. This branch is
open for new features until -rc6 of the current release cycle.

After -rc6, the branch is open for fixing bugs introduced by patches queued up
in drm-rust-next for the upcoming merge window only.

Once -rc1 is released, i.e. the features of the previous cycle have been merged
into Linus' tree, the branch is open for new features again.

drm-rust-fixes
--------------

This branch is for bug fixes which target the current -rc cycle, i.e. bugs that
are present in Linus' tree.

Merge Timeline
==============

This chart describes the merge timelines for various branches in terms of one
kernel release cycle.

.. include:: drm-rust-timeline.rst
