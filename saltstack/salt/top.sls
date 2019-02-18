base:
  '*':
    - roles.base
  'web*':
    - roles.webserver
    
#    - common
#    - nettools
#  'web*':
#    - webserver
#  'os:Fedora':
#    - match: grain
#    - rpmfusion