{% set dist = salt['cmd.shell']('echo $(rpm -E %fedora)') %}

install_rpmfusion_free:
  pkg.installed:
    - sources:
      - rpmfusion-free-release: https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-{{dist}}.noarch.rpm
  
install_rpmfusion_nonfree:
  pkg.installed:
    - sources:
      - rpmfusion-nonfree-release: https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-{{dist}}.noarch.rpm
