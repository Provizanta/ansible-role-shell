#!/usr/bin/env bash
# {{ ansible_managed }}

{% if general and general['use_color'] %}
# enable color support of ls and add color aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # color aliases
    {% for command in color_enabled_commands %}
    {{ "alias %s='%s --color=auto'" | format(command, command) }}
    {% endfor %}
fi
{% endif %}

{% if 'alias' in bash %}
# aliases
{% for key, value in bash['alias'].items() -%}
{{ "alias %s='%s'\n" | format(key, value) }}
{%- endfor -%}
{% endif %}
alias sudo='sudo '

{% if ansible_os_family | lower == 'debian' %}
# "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
{% endif %}
