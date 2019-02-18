{% set base_packages = salt['pillar.get']('base_packages', {}) %}
{% set host = salt['grains.get']('host') %}

base_packages:
  pkg.installed:
    - pkgs: {{ base_packages }}

include: 
  - bash
  - motd

{% if salt ['grains.get']('os') == 'Fedora' %}
{% set dist = salt['cmd.shell']('echo $(rpm -E %fedora)') %}
rpmfusion-free-release:
  pkg.installed:
    - sources:
      - rpmfusion-free-release: https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-{{dist}}.noarch.rpm
  
rpmfusion-nonfree-release:
  pkg.installed:
    - sources:
      - rpmfusion-nonfree-release: https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-{{dist}}.noarch.rpm
{% endif %}
