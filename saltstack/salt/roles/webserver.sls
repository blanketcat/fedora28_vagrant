install_apache:
  pkg.installed:
    - name: httpd

install_lighttpd:
  pkg.installed:
    - name: lighttpd

ensure_apache_is_running: 
  service.running:
    - name: httpd
    - enable: True
    - require: 
      - pkg: install_apache