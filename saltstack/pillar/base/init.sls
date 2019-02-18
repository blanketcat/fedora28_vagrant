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
  - python3-dateutil
  - telnet
  - nano
  - rsync
  - lftp
  - curl
  - nmap
  {% if salt['grains.get']('os') == 'Ubuntu' %}
  - python-dateutil
  {% endif %}
  {% if salt['grains.get']('os_family') == 'RedHat' %}
  - bind-utils
  - mailx
  - nfs-utils
  - nrpe
  - python2-policycoreutils
  - python3-policycoreutils
  - python2-dateutil
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

motd:
  content: |
           ######################################################
           #                                                    #
           #            This host is managed by Salt            #
           #                                                    #
           #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
           #                                                    #
           #   Changes made directly to this host may be lost   #   
           #                                                    #
           ######################################################