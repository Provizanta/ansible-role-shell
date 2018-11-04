#!/usr/bin/env bash

{% if ansible_os_family | lower == 'darwin' %}
# prevent several of the system-supplied programs (including tar) from giving special meaning to ._* archive members
export COPYFILE_DISABLE=true
{% endif %}
