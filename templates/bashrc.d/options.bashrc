#!/usr/bin/env bash
# {{ ansible_managed }}

# shell options -> $SHELLOPTS
{% for key, is_present in set.items() %}
{{ "set %so %s" | format('-' if is_present else '+', key) }}
{% endfor %}

# bash options -> $BASHOPTS
{% for option, is_present in shopt.items() %}
{{ "shopt -%s %s\n" | format('s' if is_present else 'u', option) }}
{%- endfor -%}

