
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


Fixes/Workarounds
-----------------

* Plaintext `*.gz` files
  ([#1](https://github.com/mk-pmb/debmirror-pmb/issues/1)):
  They're auto-detected and copied verbatim,
  instead of trying (and failing) to decompress them.
* Exotic directory structure in source repos:
  ([#2](https://github.com/mk-pmb/debmirror-pmb/issues/2)):
  Perl code in env var `DM_EVAL_HTTPGET_MODIFY_URL` is `eval`-ed so it can
  fix the URL in `$_`. In simple cases, the code may consist of just a regexp,
  e.g. `s~(/waterfox/[\w\.]+/)(dists/[\w\.]+/(main/binary-amd64/|)|)~$1~;`.



Known issues
------------

* Is there an upstream repo for DM?
* Is there an upstream issue tracker?
  * In theory it's the one on Ubuntu launchpad, which should lead upstream
    to the Debian BTS (Bug Tracking System). Good luck with those.
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
