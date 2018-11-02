{%- for setting, value in history.settings.items() -%}
{{ "HIST%s=%s\n" | format(setting | upper, value) }}
{%- endfor -%}
