{% set base_packages = salt['pillar.get']('base_packages', {}) %}
{% set host = salt['grains.get']('host') %}

base_packages:
  pkg.installed:
    - pkgs: {{ base_packages }}

include: 
  - bash
  - motd
