rootfile:
  file.managed:
    - name: /root/hello_you.txt
    - user: root
    - group: root
    - mode: '0644'
    - contents_pillar: hello_you:content
