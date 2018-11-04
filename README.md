Shell
=========

Install structured bash configuration into the user home.

Much of the basic configuration was adapted from the default XUbuntu .bashrc, along with minor modifications.

Other improvements were inspired by:
- [vinioliveira](https://gist.github.com/vinioliveira/909111)
- [DenisCarriere](https://github.com/DenisCarriere/.bashrc.git)
- [redguardtoo](https://gist.github.com/redguardtoo/01868d7a13817c9845e8)

Requirements
------------

None

Role Variables
--------------

    general:
      use_color: <boolean, indicating whether to use color output>
      file_behavior: <'replace' or anything else, replace removes the existing directory containing the configurations, if present> 

    history: <settings in uppercase/lowercase format not containing the HIST prefix along with a value>

    shopt: <key-value pairs of shopt setting and a boolean value indicating the options's desired status - set or unset>

    alias: <key-value pairs of aliases>

    functions: <key-value pairs of function group and a boolean value indicating the group's desired presence> 

Dependencies
------------

None

Example Playbook
----------------

    - hosts: localhost
      roles:
        - role: shell
          vars:
            general:
              use_color: no
            history:
              size: 1500
            shopt:
              histappend: yes
            alias:
              mkdir: 'mkdir -p'

License
-------

MIT

Author Information
------------------

Tibor Csoka
