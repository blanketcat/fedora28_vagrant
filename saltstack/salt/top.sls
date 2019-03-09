base:
  '*':
    - roles.base
  'web*':
    - roles.webserver
  'ha-proxy*':
    - roles.load_balancer

  # Match Research server instances.
  'roles:research_server':
    - match: grain
    - roles.research_server


#    - common
#    - nettools
#  'web*':
#    - webserver
#  'os:Fedora':
#    - match: grain
#    - rpmfusion