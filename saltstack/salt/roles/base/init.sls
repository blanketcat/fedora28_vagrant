include: 
#  - hosts
{%- if grains['kernel'] == 'Linux' %}
  - base.linux
{%- endif %}
{%- if grains['kernel'] == 'Windows' %}
  - base.windows
{%- endif %}