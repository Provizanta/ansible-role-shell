Ansible role: Shell
=========

[![Build Status](https://travis-ci.com/Provizanta/ansible-role-shell.svg?branch=master)](https://travis-ci.com/Provizanta/ansible-role-shell)

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

    inputrc: <list of strings, contains the content of .inputrc file replacing the system-wide /etc/inputrc >

Dependencies
------------

None

Example Playbook
----------------

    - hosts: localhost
      roles:
        - role: shell
          vars:
            inputrc:
              - "set completion-ignore-case On"
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
              functions:
                - |
                  with_trace() {
                      if [ -n "$1" ] ; then
                          local original_xtrace_setting
                          original_xtrace_setting="$(shopt -po xtrace)"

                          set -x
                          $1
                          { STATUS=$?; eval "$original_xtrace_setting"; } 2>/dev/null

                          return $STATUS
                      else
                          echo "usage: with_trace '<command>'"
                      fi
                  }

License
-------

MIT

Author Information
------------------

Tibor Csóka
