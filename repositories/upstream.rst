.. _upstream:

========
Upstream
========

Maintained by Linus Torvalds.

Repository and Branches
=======================

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

master
------

Linus' master, the upstream, or mainline. This is where all features from all
subsystems, including DRM and i915, are merged.

The upstream follows a single branch, time-based development model, with a new
kernel release occurring roughly every 10 weeks. New features are merged from
subsystem trees during the two week merge window immediately following a kernel
release. After the merge window, the new development kernel is stabilized by
only merging fixes until the next kernel release. During development, there's a
new release candidate (-rc) kernel each week.
