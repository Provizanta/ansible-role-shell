#!/usr/bin/env bash

{% if general and general['use_color'] %}
{% if ansible_os_family | lower == 'darwin' %}
# MacOS and FreeBSD color specific variable - https://www.freebsd.org/cgi/man.cgi?query=ls&apropos=0&sektion=1&format=html
# order: directory; symbolic link; socket; pipe; executable; block special; character special; executable with	setuid bit set; executable with	setgid bit set; directory writable to others, with sticky bit; directory writable to others, without sticky bit
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
{% else %}
# http://linux-sxs.org/housekeeping/lscolors.html
export LS_COLORS='di=1;34:fi=0:ln=1;32:pi=5;33:so=5;35:bd=5;36:cd=5;37:or=41;1;0:mi=0;41:ex=1;32'
{% endif %}
{% endif %}

{% if ansible_os_family | lower == 'darwin' %}
# prevent several of the system-supplied programs (including tar) from giving special meaning to ._* archive members
export COPYFILE_DISABLE=true
{% endif %}
