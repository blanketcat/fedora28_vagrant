install_nginx:
  pkg.installed:
    - name: nginx

/etc/nginx/conf.d/load_balancer.conf:
  file.managed:
    - source: salt://roles/load_balancer/files/load_balancer.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nginx

enable_ip_forwarding:
  cmd.run:
    - name: sysctl net.ipv4.ip_forward=1
    - onlyif: sysctl net.ipv4.ip_forward | grep '0'

/etc/sysconfig/iptables.save:
  file.managed:
    - source: salt://roles/load_balancer/files/iptables.save
    - user: root
    - group: root
    - mode: 644

set_iptables:
  cmd.run:
    - name: iptables-restore < /etc/sysconfig/iptables.save
    - unless: iptables -t mangle -L --line-number | grep 192.168.10.0
    - order: last 
