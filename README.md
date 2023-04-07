Ansible role: shell
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

These variables are defined in [defaults/main.yml](./defaults/main.yml):

    shell_bash_install: false

    shell_zsh_intsall: false

These variables do not have a default value and can be specified:

    shell_inputrc:          <list of strings, contains the line content of .shell_inputrc file replacing the system-wide /etc/shell_inputrc>

    shell_bash_rc:          <string, holding the contents of the .bashrc file>

    shell_zsh_rc:           <string, the contents of the .zshrc file>

    shell_zsh_oh_my_zsh:    <bool, whether oh my zsh should be installed>

    shell_default:          <string, shell name, e.g. zsh, to be selected as the default shell for the provisioned user>


Dependencies
------------

None

Example Playbook
----------------

    - hosts: localhost
      roles:
        - role: shell
          vars:
            shell_inputrc:
              - "set completion-ignore-case On"
            shell_default: zsh
            shell_zsh_install: true
            shell_zsh_oh_my_zsh: true
            shell_bash_install: true
            shell_bash_rc: |
              #!/usr/bin/env bash
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
