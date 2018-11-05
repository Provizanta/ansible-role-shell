#!/usr/bin/env bash
# {{ ansible_managed }}

{% for option, is_present in shopt.items() %}
{{ "shopt -%s %s\n" | format('s' if is_present else 'u', option) }}
{%- endfor -%}

