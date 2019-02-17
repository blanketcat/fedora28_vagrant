bash:
  file.managed:
    - name: /etc/profile.d/zzcustom.sh
    - user: root
    - group: root
    - mode: '0644'
    - contents_pillar: bash:profile
    - allow_empty: True
