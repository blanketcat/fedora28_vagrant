base_packages:
  - git
  - tree
  - wget
  - lsof
  - sysstat
  - strace
  - rsync
  - time
  - screen
  - autofs
  - mlocate
  - tcpdump
  - traceroute
  - sysstat
  - policycoreutils
  - telnet
  - nano
  - python2-dateutil
  - python3-dateutil
  {% if salt['grains.get']('os_family') == 'RedHat' %}
  - bind-utils
  - mailx
  - nfs-utils
  - nrpe
  - python2-policycoreutils
  - python3-policycoreutils
  - setools-console
  - setroubleshoot-server
  - vim-enhanced
  - yum-plugin-versionlock
  {% endif %}

bash:
  profile: |
    shopt -s checkwinsize
    shopt -s histappend
    unset MAILCHECK
    export EDITOR=vim
    export PATH=$PATH:~/.bin
    export HISTSIZE=10000000
    export HISTCONTROL=ignoredups
    export HISTTIMEFORMAT='%F %T '
    export PROMPT_COMMAND='history -a'
    export LSCOLORS='Gxfxcxdxdxegedabagacad'
    export PS1='\[\033[01;35m\]\u@\H\[\033[01;34m\] \W \$\[\033[00m\] '
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'