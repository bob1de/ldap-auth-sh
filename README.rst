A Simple Shell Script to Authenticate Against LDAP
==================================================

This is a simple but extensible shell script to authenticate users by
binding to LDAP. Additional checks, such as requiring group memberships,
can easily be configured. The credentials are read from environment
variables. In case of a successful authentication, it exits with exit
code 0, non-zero otherwise.

ldap-auth-sh is known to work with:

* **OpenVPN** (via the ``--auth-user-pass-verify`` option)
* **Home Assistant** (via the upcoming ``command_line`` auth provider)

However, it's of course not limited to these platforms.


Requirements
------------

You need:

* a POSIX-compliant shell with ``cat``, ``grep`` and ``sed`` (even
  BusyBox will do)
* a compatible LDAP client, currently one of

  * ``curl`` (with ``ldap`` protocol support compiled in, verify with
    ``curl --version``)
  * ``ldapsearch``


Getting Started
---------------

Just copy the file `ldap-auth.inc <ldap-auth.inc>`_ and read the comments
therein.

Sample configurations are shipped in the `examples <examples>`_ directory.
