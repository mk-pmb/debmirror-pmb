
<!--#echo json="package.json" key="name" underline="=" -->
debmirror-pmb
=============
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
Improved fork of debmirror
<!--/#echo -->


Usage
-----

* [example config](usr/share/doc/debmirror/examples/debmirror.conf)
* If you want to mirror more than one repo or distro, try
  [debmirror-easy](https://github.com/mk-pmb/debmirror-easy).


<!--#toc stop="scan" -->


Fixes
-----

* Detect when `*.gz` files are actually plaintext instead of gzip
  ([example](http://web.archive.org/web/20170728133446/https://deb.packager.io/gh/pkgr/gogs/dists/trusty/pkgr/binary-amd64/Packages.gz)).
  If so, don't try (and fail) to decompress them, instead just copy them.



Known issues
------------

* Is there an upstream repo?
* Is there an upstream issue tracker?
  (In theory it's the one on ubuntu launchpad, which should lead upstream to
  the Debian BTS (Bug Tracking System). Good luck with those.)
* Code quality is quite poor, would require full refactor to develop further.
  * Loooong conditional sections should go into named subs
  * Several "FIXME"s
  * Lots of highly dubious shell commands.
    * Lacking clarification whether argument is meant as option or operand.
    * Probably exploitable for remote shell command injection.


&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
GPL-2+
<!--/#echo -->
