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

    bash:
      rc_d_dir: <string, path to the rc.d dir>

      general:
        use_color: <boolean, indicating whether to use color output>
        file_behavior: <'replace' or anything else, replace removes the existing directory containing the configurations, if present>

      history: <settings in uppercase/lowercase format not containing the HIST prefix along with a value>

      shopt: <key-value pairs of a shell option and a boolean value indicating the options's desired status - set or unset>

      set: <key-value pairs of a setting and a boolean value indicating the options's desired status - set or unset>

      alias: <key-value pairs of aliases>

      functions: <list, entire text to be inlined into the 'functions' section of the bashrc.d>

Dependencies
------------

None

Example Playbook
----------------

    - hosts: localhost
      roles:
        - role: shell
          vars:
            bash:
              rc_d_dir: ~/.bashrc.d/
              general:
                use_color: no
              history:
                size: 1500
              shopt:
                histappend: yes
              set:
                history: yes
              alias:
                mkdir: 'mkdir -p'

License
-------

MIT

Author Information
------------------

Tibor Csoka
