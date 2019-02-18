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
    - watch:
      - file: file_mod_status.conf
      - file: file_mod_status.load

file_mod_status.conf:
  file.managed:
    - name: /etc/httpd/conf.modules.d/status.conf
    - source: salt://mod_status.conf
    - user: root
    - group: root
    - mode: 600

file_mod_status.load:
  file.managed:
    - name: /etc/httpd/conf.modules.d/status.load
    - source: salt://mod_status.load
    - user: root
    - group: root
    - mode: 600