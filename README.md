Shell
=========

Install structured bash configuration into the user home.

Much of the basic configuration was adapted from the default XUbuntu .bashrc, along with minor modifications.

Requirements
------------

None

Role Variables
--------------

    general:
      use_color: <boolean, indicating whether to use color output>
      file_behavior: <'replace' or anything else, replace removes the existing directory containing the configurations, if present> 

    history:
      settings: <settings in uppercase/lowercase format not containing the HIST prefix along with a value>

    shopt: <key-value pairs of shopt setting and a boolean value indicating whether to set or unset the option>

    alias: <key-value pairs of aliases> 

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
